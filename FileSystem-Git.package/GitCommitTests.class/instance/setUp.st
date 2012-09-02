running
setUp
	super setUp.
	repoDir := FSFilesystem memory workingDirectory / 'repo'.
	repository := GitRepository on: repoDir.
	self createSomeCommits