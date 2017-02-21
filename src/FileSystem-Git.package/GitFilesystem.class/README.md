I am wrapper for accessing the files of a specific revision from a git repository. I am almost never used directly but create by a FSGitRepository.

	ref := FSFilesystem onDisnk / 'home' / 'MyUser' / 'foo.git'.
	basicRepository := GitRepository on: ref.
	fsRepository := FSGitRepository  on: ref.
	workingCopy := fsRepository head. "this returns an FSGitFilesystem for head"