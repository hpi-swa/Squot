running
setUp
	super setUp.
	repository := GitRepository on: (FileSystem memory / 'testRepo').
	repository withUnitOfWork: [self setUpRepositoryObjects].