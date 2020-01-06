actions on versions
actionCommitNewCherryPick
	| pickedVersion parentVersions parentVersion workingCopy cherryPick |
	pickedVersion := self commitSelection.
	workingCopy := self projectSelection.
	self flag: #todo. "extract parent selection"
	parentVersions := pickedVersion parents.
	parentVersion := parentVersions size caseOf: {
		[0] -> [nil].
		[1] -> [pickedVersion parents anyOne]}
	otherwise: [UIManager default
			chooseFrom: (parentVersions collect: #printString)
			values: parentVersions
			title: 'Pick changes in comparison to which parent?'].
	(cherryPick := workingCopy newCherryPickOperation)
		requestor: self;
		pickedVersion: pickedVersion;
		relevantParentOfPickedVersion: parentVersion.
	cherryPick applyToWorkingCopyInteractively
		whenRejected: [:reason | self inform: 'Cherry pick aborted: ', reason].