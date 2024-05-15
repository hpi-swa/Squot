ui
commitList
	| commits |
	self ifRepositoryDoesNotExist: [^ {}].
	self activeWorkingCopy ifNil: [^ {}].
	commits := self withUnitOfWork: [GitHistoryWalker new startingFromAll: self commitListStartingCommits].
	self ensureActiveCommitIdentityIn: commits.
	^ commits