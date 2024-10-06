ui
commitListStartingCommits
	^ {self activeRefCommit ifNil: [self activeWorkingCopy ifNotNil: #headCommit]} select: #notNil