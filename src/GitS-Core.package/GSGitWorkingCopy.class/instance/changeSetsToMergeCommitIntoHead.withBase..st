changes-creation
changeSetsToMergeCommitIntoHead: rightCommit withBase: baseCommit
	^ self
		changeSetsToMergeCommit: rightCommit
		into: self headCommit
		withBase: baseCommit