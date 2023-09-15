ui
commitListStartingCommits
	^ {self activeRefCommit ifNil: [self workingCopy headCommit]} select: #notNil