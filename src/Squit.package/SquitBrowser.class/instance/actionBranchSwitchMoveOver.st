actions on branches
actionBranchSwitchMoveOver
	self hasBranchSelection ifFalse: [^ self].
	self projectSelection switchAndMoveUnsavedChangesOverTo: selectedHistorian.
	self activeBranchChanged.