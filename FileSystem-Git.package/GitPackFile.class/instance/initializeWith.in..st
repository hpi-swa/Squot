initialize-release
initializeWith: aReference in: aRepository
	self 
		repository: aRepository;
		reference: aReference;
		readHeaders;
		initializeIndex