actions
actionMerge
	self projectSelection ifNil: [^ self].
	self commitSelection ifNil: [^ self].
	self projectSelection mergeVersionInteractively: self commitSelection.
	[self actionCommit] on: SquotInitialLogMessageRequested
		do: [:request | request resume: 'Merge ', self branchSelection historian name].
	self refresh.