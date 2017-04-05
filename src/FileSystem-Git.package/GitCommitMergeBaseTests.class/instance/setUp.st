running
setUp
	| repoDir |
	super setUp.
	repoDir := FileSystem memory workingDirectory / 'repo'.
	repository := GitRepository on: repoDir.
	(fakeTree := GitTree
		entries: {GitTreeEntry fileNamed: 'fake' hash: 0 in: repository}
		in: repository)
		store.