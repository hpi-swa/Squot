instance creation
directoryNamed: aString hash: integerHash in: aRepository
	^ self new
		entryName: aString;
		entryHash: integerHash;
		repository: aRepository;
		beInDirectoryMode;
		yourself