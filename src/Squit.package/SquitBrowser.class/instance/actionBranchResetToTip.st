actions on branches
actionBranchResetToTip
	| workingCopy |
	workingCopy := self projectSelection.
	(self confirm: 'Do you really want to discard all your uncommitted changes?')
		ifFalse: [^ self].
	workingCopy discardUnsavedChanges.