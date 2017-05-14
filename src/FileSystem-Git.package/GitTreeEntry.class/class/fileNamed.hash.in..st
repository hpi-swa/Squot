instance creation
fileNamed: aString hash: integerHash in: aRepository
	^ self new
		entryName: aString;
		entryHash: integerHash;
		repository: aRepository;
		beInFileMode;
		yourself