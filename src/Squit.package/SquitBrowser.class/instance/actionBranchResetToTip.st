actions on branches
actionBranchResetToTip
	(self confirm: 'Do you really want to discard all your uncommitted changes?')
		ifFalse: [^ self].
	self projectSelection discardUnsavedChanges.