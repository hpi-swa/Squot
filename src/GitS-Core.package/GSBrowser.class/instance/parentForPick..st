accessing
parentForPick: aCommit
	^ aCommit parents at: 1 ifAbsent: [self emptyCommit]