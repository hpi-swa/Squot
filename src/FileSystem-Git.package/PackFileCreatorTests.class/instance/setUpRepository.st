running
setUpRepository
	repository := GitRepository on: (FileSystem memory root / 'repo').
	repository withUnitOfWork: [self createSomeBlobs].