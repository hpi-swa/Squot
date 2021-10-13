accessing
selectRepository: repository

	self repositoryListIndex: (repository
		ifNotNil: [self repositoryList findFirst: [:ea | ea repository = repository]]
		ifNil: [0]).