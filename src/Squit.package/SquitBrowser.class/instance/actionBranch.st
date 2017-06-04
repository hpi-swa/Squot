actions
actionBranch
	self hasBranchSelection ifFalse: [^ self].
	(self createNewBranchAt: selectedHistorian version) ifFalse: [^ self].
	self refresh.