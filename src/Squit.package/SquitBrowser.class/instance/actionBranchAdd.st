actions
actionBranchAdd
	self commitSelection ifNil: [^ self].
	(self createNewBranchAt: self commitSelection version) ifFalse: [^ self].
	self refresh.