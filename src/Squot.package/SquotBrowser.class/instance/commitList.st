accessing
commitList
	^ self withUnitOfWork: [GitHistoryWalker new startingFromAll: self commitListStartingCommits]