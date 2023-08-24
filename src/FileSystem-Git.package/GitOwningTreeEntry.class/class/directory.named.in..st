as yet unclassified
directory: aTree named: aString in: aRepository
	^ self new
		entryName: aString;
		object: aTree;
		repository: aRepository;
		beInDirectoryMode;
		yourself