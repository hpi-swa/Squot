actions on versions
actionBranchAdd
	self commitSelection ifNil: [^ self].
	self withUnitOfWork:
	[selectedHistorian := self createNewBranchAt: self commitSelection ifCanceled: [^ self].
	self loadBranchList.
	self branchSelectionChanged].