running
setUpRepository
	repository := GitRepository on: (FileSystem memory root / 'repo').
	self createSomeBlobs.