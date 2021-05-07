ui
branchList
	self hasProjectSelection
		ifTrue: [branchList ifNil: [self withUnitOfWork: [self loadBranchList]]]
		ifFalse: [branchList := #()].
	^ #('-- Branches --'), branchList