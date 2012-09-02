running
setUp
	super setUp.
	repoDir := FileSystem memory workingDirectory / 'repo'.
	repository := GitRepository on: repoDir.
	self createSomeCommits