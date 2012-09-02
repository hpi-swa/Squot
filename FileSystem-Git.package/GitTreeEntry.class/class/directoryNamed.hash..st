instance creation
directoryNamed: aString hash: integerHash
	^ self new
		entryName: aString;
		entryHash: integerHash;
		beInDirectorymode;
		yourself