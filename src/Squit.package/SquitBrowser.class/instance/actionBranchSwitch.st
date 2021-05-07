actions on branches
actionBranchSwitch
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[self projectSelection switchTo: selectedHistorian.
	self activeBranchChanged].