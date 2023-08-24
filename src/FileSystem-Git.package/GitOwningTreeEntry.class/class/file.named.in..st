as yet unclassified
file: aBlob named: aString in: aRepository
	^ self new
		entryName: aString;
		object: aBlob;
		repository: aRepository;
		beInFileMode;
		yourself