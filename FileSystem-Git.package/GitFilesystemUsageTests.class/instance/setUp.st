running
setUp
	| ref |
	super setUp.
	shouldValidateRepos := true.
	ref := FileSystem memory / 'testRepo'.
	basicRepository := GitRepository on: ref.
	fsRepository := FileSystemGitRepository  on: ref.
	workingCopy := fsRepository head