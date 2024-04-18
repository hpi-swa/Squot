importing
importSquotContents
	| filesystem readStream loadOrder |
	self mappers ifNotEmpty: [^ self].
	filesystem := (self headFSCommit ifNil: [^ self]) filesystem.
	readStream := [filesystem readStreamOn: '.squot'] on: FileDoesNotExist do: [^ self].
	loadOrder := STON fromStream: readStream.
	loadOrder ifEmpty: [^ self].
	(self confirm: 'Found repository metadata in old format. Convert it and commit the conversion?')
		ifFalse: [^ self].
	loadOrder keysAndValuesDo: [:path :serializer |
		self
			importSquotContents: (SquotPathUtilities fromString: path) / '.squot-contents'
			from: filesystem
			fallbackSerializer: serializer].
	self mappers ifEmpty: [^ self inform: 'Conversion produced no metadata, no commit will be made.'].
	self commitImportedMappers.