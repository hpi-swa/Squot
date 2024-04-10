actions
actionCreateBranchAtCommitAndSwitchToIt: aCommit
	self actionSwitchToBranch: ((self actionCreateBranchAtCommit: aCommit) ifNil: [^ self]).