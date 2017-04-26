actions
actionBranchSwitch
	self branchSelection ifNil: [^ self].
	self projectSelection loadedHistorian: self branchSelection historian.
	self refresh.