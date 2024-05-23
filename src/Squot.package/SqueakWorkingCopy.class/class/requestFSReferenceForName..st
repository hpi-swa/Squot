instance creation
requestFSReferenceForName: aString
	| defaultDirectory defaultDirectoryExisted defaultDirectoryReference chosen |
	defaultDirectory := self defaultDirectoryForName: aString.
	defaultDirectoryExisted := defaultDirectory exists.
	defaultDirectoryReference := defaultDirectory asFSReference.
	defaultDirectoryReference ensureCreateDirectory.
	chosen := UIManager default chooseDirectory: 'Repository location:' from: defaultDirectory.
	(defaultDirectoryExisted not and: [chosen ~= defaultDirectory]) ifTrue: [defaultDirectoryReference delete].
	^ chosen ifNotNil: [ | reference |
		reference := chosen asFSReference.
		reference children ifNotEmpty: [
			self inform: 'Please choose an empty directory.'.
			^ self requestFSReferenceForName: aString].
		reference]