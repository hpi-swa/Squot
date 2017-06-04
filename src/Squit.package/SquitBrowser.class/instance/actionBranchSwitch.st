actions
actionBranchSwitch
	self hasBranchSelection ifFalse: [^ self].
	self projectSelection loadedHistorian: selectedHistorian.
	self loadBranchList; changed: #branchList.