ui
commitListStartingCommits
	^ {self workingCopy headCommit} select: #notNil