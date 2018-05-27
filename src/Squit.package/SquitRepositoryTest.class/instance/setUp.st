running
setUp
	fsGitRepository := self repositoryForTests.
	gitRepository := fsGitRepository repository.
	squitRepository := SquitRepository on: fsGitRepository.
	self createReadmeCommit.