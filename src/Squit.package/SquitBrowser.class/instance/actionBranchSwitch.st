actions on branches
actionBranchSwitch
	self hasBranchSelection ifFalse: [^ self].
	self projectSelection switchTo: selectedHistorian.
	self activeBranchChanged.