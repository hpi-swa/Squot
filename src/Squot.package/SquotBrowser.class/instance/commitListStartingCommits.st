accessing
commitListStartingCommits
	^ {self workingCopy headCommit} select: #notNil