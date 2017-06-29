actions on versions
actionBranchAdd
	self commitSelection ifNil: [^ self].
	self createNewBranchAt: self commitSelection ifCanceled: [^ self].
	self refresh.