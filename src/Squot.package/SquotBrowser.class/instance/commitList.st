ui
commitList
	self activeWorkingCopy ifNil: [^ {}].
	^ self withUnitOfWork: [GitHistoryWalker new startingFromAll: self commitListStartingCommits]