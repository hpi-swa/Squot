running
setUp
	super setUp.
	gitDir := FileSystem memory / 'test.git'.
	repository := GitRepository on: gitDir.