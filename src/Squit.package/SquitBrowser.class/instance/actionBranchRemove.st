actions
actionBranchRemove
	self branchSelection ifNil: [^ self].
	(UIManager confirm: 'Really delete branch ', self branchSelection historian name, '?')
		ifFalse: [^ self].
	self projectSelection repository delete: self branchSelection historian.
	self refresh.