running
setUp
	super setUp.
	shouldValidateRepos := true.
	reference := FileSystem memory / 'testRepo'.
	basicRepository := GitRepository on: reference.
	fsRepository := FileSystemGitRepository  on: reference.
	workingCopy := fsRepository head.