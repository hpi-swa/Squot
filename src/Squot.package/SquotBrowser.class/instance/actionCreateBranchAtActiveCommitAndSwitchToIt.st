actions
actionCreateBranchAtActiveCommitAndSwitchToIt
	self actionSwitchToBranch: (self actionCreateBranchAtActiveCommit ifNil: [^ self]).