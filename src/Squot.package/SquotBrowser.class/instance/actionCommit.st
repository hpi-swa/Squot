actions
actionCommit
	(SquotChangesDialog
		withWorkingCopy: self workingCopy
		changeSets: self workingCopy changeSetsFromHeadCommitToImage) open.