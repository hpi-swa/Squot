actions
actionBranch
	self hasBranchSelection ifFalse: [^ self].
	selectedHistorian := self createNewBranchAt: selectedHistorian version ifCanceled: [^ self].
	self branchSelectionChanged.