git-operations
mergeCommitIntoHead: rightCommit withBase: baseCommit
	^ self
		mergeCommit: rightCommit
		into: self headCommit
		withBase: baseCommit