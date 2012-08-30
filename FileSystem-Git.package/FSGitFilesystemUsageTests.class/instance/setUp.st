running
setUp
	| ref |
	super setUp.
	ref := FSFilesystem memory / 'testRepo'.
	basicRepository := GitRepository on: ref.
	fsRepository := FSGitRepository  on: ref.
	workingCopy := fsRepository head