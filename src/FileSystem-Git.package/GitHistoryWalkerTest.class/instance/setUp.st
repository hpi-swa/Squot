running
setUp
	super setUp.
	repository := GitRepository on: (FileSystem memory / 'test.git').
	repository withUnitOfWork: [self createSomeObjects].
	historyWalker := GitHistoryWalker new.