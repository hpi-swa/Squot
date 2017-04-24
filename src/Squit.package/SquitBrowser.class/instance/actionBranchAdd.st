actions
actionBranchAdd
	self commitSelection ifNil: [^ self].
	(self createNewBranchAt: self commitSelection) ifFalse: [^ self].
	self refresh.