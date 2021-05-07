running
setUp
	| repoDir |
	super setUp.
	repoDir := FileSystem memory workingDirectory / 'repo'.
	repository := GitRepository on: repoDir.
	repository withUnitOfWork: [self createFakeTree].