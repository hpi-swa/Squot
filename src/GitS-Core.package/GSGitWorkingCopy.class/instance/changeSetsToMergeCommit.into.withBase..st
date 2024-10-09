changes-creation
changeSetsToMergeCommit: rightCommit into: leftCommit withBase: baseCommit
	^ self
		changeSetsToMergeFSCommit: (self fsCommitFrom: rightCommit)
		into: (self fsCommitFrom: leftCommit)
		withBase: (self fsCommitFrom: baseCommit)