tests
testSaveSnapshotsBeforeTheDialogIsShown
	| save |
	workingCopy add: ValueHolder new at: 'object'.
	(workingCopy objectAt: 'object') contents: #beforeSave.
	save := workingCopy newSaveOperation.
	(workingCopy objectAt: 'object') contents: #afterSave.
	save message: 'Add object'; applyToWorkingCopy.
	workingCopy discardUnsavedChanges.
	self assert: #beforeSave equals: (workingCopy objectAt: 'object') contents.