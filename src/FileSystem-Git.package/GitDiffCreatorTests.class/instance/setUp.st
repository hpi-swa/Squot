running
setUp
	| gitDir |
	super setUp.
	gitDir := FileSystem memory / 'test.git'.
	repository := GitRepository on: gitDir.
	diffCreator := GitDiffCreator new.