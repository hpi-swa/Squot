actions on versions
actionCommitCherryPick
	| pickedVersion parentVersions parentVersion workingCopy |
	(self hasProjectSelection and: [self hasCommitSelection]) ifFalse: [^ self].
	SquotToggles enableRefactoredCherryPick ifTrue: [^ self actionCommitNewCherryPick].
	self withUnitOfWork:
	[pickedVersion := self commitSelection.
	workingCopy := self projectSelection.
	parentVersions := pickedVersion parents.
	parentVersion := parentVersions size caseOf: {
		[0] -> [nil].
		[1] -> [pickedVersion parents anyOne]}
	otherwise: [SquotGUI
			chooseFrom: (parentVersions collect: #printString)
			values: parentVersions
			title: 'Pick changes in comparison to which parent?'].
	[workingCopy cherryPickInteractivelyFromVersion: pickedVersion
		withParent: parentVersion
		ifLoadCanceled: [^ self]
		ifSaveCanceled: [:revertBlock |
			(self confirm: 'Revert picked changes?') ifTrue: [revertBlock value]]]
	on: SquotInitialLogMessageRequested
	do: [:request | request resume:
		pickedVersion message,
		String cr, String cr,
		'(cherry-picked from commit ', pickedVersion internalId, ')']].