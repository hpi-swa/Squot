running
setUp
	super setUp.
	repository := GitRepository on: (FileSystem memory / 'testRepo').
	self setUpRepositoryObjects.