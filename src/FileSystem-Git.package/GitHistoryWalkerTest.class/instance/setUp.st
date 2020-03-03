running
setUp
	super setUp.
	repository := GitRepository on: (FileSystem memory / 'test.git').
	self createSomeObjects.
	historyWalker := GitHistoryWalker new.