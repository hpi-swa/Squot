actions
actionBranch
	self hasBranchSelection ifFalse: [^ self].
	self createNewBranchAt: selectedHistorian version ifCanceled: [^ self].
	self refresh.