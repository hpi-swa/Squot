importing
importSquotContentsFromCommit: aCommit
	| filesystem readStream loadOrder newMappers |
	filesystem := self filesystemOn: aCommit.
	(self metadataMapper hasAnyFile: filesystem) ifTrue: [^ nil].
	readStream := [filesystem readStreamOn: '.squot'] on: FileDoesNotExist do: [^ nil].
	loadOrder := STON fromStream: readStream.
	loadOrder ifEmpty: [^ nil].
	(self confirm: 'Found repository metadata in old format. Convert it and commit the conversion?')
		ifFalse: [^ nil].
	newMappers := OrderedCollection new.
	loadOrder keysAndValuesDo: [:path :serializer |
		self
			importSquotContents: (SquotPathUtilities fromString: path) / '.squot-contents'
			from: filesystem
			into: newMappers
			fallbackSerializer: serializer].
	^ self commitImportedMappers: newMappers on: aCommit