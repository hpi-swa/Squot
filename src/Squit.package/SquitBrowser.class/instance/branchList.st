ui
branchList
	self hasProjectSelection
		ifTrue: [branchList ifNil: [self withUnitOfWork: [self loadBranchList]]]
		ifFalse: [^ self branchListIfRepositoryDoesNotExist].
	^ #('-- Branches --'), branchList