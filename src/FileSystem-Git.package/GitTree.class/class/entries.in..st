accessing
entries: aCollection in: aRepository
	^ self new 
		entries: aCollection;
		repository: aRepository;
		yourself