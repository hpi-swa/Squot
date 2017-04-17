actions
actionBranch
	self branchSelection ifNil: [^ self].
	(self createNewBranchAt: self branchSelection historian version) ifFalse: [^ self].
	self refresh.