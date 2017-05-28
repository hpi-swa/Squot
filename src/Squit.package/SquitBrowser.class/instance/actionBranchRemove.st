actions
actionBranchRemove
	self branchSelection ifNil: [^ self].
	self branchSelection historian = self projectSelection loadedHistorian
		ifTrue: [^ self inform: 'Cannot delete the active branch, switch to another branch before.'].
	(UIManager confirm: 'Really delete branch ', self branchSelection historian name, '?')
		ifFalse: [^ self].
	self projectSelection repository delete: self branchSelection historian.
	commitSelection := nil.
	self refresh.