actions on branches
actionBranchSwitchMoveOver
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[self projectSelection switchAndMoveUnsavedChangesOverTo: selectedHistorian.
	self activeBranchChanged].