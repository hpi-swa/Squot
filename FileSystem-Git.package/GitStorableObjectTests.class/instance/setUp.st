running
setUp
	super setUp.
	repository := GitRepository on: (FSFilesystem memory / 'repo')