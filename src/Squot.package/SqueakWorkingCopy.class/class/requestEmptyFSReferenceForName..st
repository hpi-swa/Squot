instance creation
requestEmptyFSReferenceForName: aString
	| reference |
	reference := (self requestFSReferenceForName: aString) ifNil: [^ nil].
	reference children ifEmpty: [^ reference].
	self inform: 'Please choose an empty directory.'.
	^ self requestEmptyFSReferenceForName: aString