actions
actionCreateBranchAtActiveRefAndSwitchToIt
	self actionSwitchToBranch: (self actionCreateBranchAtActiveRef ifNil: [^ self]).