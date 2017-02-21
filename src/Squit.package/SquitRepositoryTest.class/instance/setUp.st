running
setUp
	gitRepository := self repositoryForTests.
	squitRepository := SquitRepository on: gitRepository.
	oldMaster := (gitRepository branchNamed: 'master') revision.