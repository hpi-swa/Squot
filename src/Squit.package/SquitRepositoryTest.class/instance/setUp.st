running
setUp
	gitRepository := self repositoryForTests.
	squitRepository := SquitRepository on: gitRepository.
	self createReadmeCommit.