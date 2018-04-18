actions on versions
actionCommitCherryPick
	| pickedVersion parentVersions parentVersion workingCopy |
	pickedVersion := self commitSelection.
	workingCopy := self projectSelection.
	parentVersions := pickedVersion parents.
	parentVersion := parentVersions size caseOf: {
		[0] -> [nil].
		[1] -> [pickedVersion parents anyOne]}
	otherwise: [UIManager default
			chooseFrom: (parentVersions collect: #printString)
			values: parentVersions
			title: 'Pick changes in comparison to which parent?'].
	[workingCopy cherryPickInteractivelyFromVersion: pickedVersion
		withParent: parentVersion
		ifLoadCanceled: [^ self]
		ifSaveCanceled: [:revertBlock |
			(UIManager default confirm: 'Revert picked changes?') ifTrue: [revertBlock value]]]
	on: SquotInitialLogMessageRequested
	do: [:request | request resume:
		pickedVersion message,
		String cr, String cr,
		'(cherry-picked from commit ', pickedVersion internalId, ')'].