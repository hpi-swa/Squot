actions on versions
actionBranchAdd
	self commitSelection ifNil: [^ self].
	selectedHistorian := self createNewBranchAt: self commitSelection ifCanceled: [^ self].
	self branchSelectionChanged.