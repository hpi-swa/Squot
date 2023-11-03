instance creation
requestFSReferenceForName: aString
	| defaultDirectory defaultDirectoryExisted defaultDirectoryReference chosen |
	defaultDirectory := self defaultDirectoryForName: aString.
	defaultDirectoryExisted := defaultDirectory exists.
	defaultDirectoryReference := defaultDirectory asFSReference.
	defaultDirectoryReference ensureCreateDirectory.
	chosen := UIManager default chooseDirectory: 'Repository location:' from: defaultDirectory.
	(defaultDirectoryExisted not and: [chosen = defaultDirectory]) ifFalse: [defaultDirectoryReference delete].
	^ chosen ifNotNil: #asFSReference