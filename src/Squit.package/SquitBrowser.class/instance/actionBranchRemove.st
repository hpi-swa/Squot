actions
actionBranchRemove
	self hasBranchSelection ifFalse: [^ self].
	selectedHistorian = self projectSelection loadedHistorian
		ifTrue: [^ self inform: 'Cannot delete the active branch, switch to another branch before.'].
	(UIManager confirm: 'Really delete branch ', selectedHistorian name, '?')
		ifFalse: [^ self].
	self projectSelection repository delete: selectedHistorian.
	commitSelection := nil.
	self refresh.