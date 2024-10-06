git-operations
mergeCommit: rightCommit into: leftCommit withBase: baseCommit
	^ self
		mergeFSCommit: (self fsCommitFrom: rightCommit)
		into: (self fsCommitFrom: leftCommit)
		withBase: (self fsCommitFrom: baseCommit)