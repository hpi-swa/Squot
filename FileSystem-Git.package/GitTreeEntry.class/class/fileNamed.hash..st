instance creation
fileNamed: aString hash: integerHash
	^ self new
		entryName: aString;
		entryHash: integerHash;
		beInFilemode;
		yourself