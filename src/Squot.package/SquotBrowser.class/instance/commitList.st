ui
commitList
	self ifRepositoryDoesNotExist: [^ {}].
	self activeWorkingCopy ifNil: [^ {}].
	^ self withUnitOfWork: [GitHistoryWalker new startingFromAll: self commitListStartingCommits]