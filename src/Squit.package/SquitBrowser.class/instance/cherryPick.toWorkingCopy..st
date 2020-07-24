actions
cherryPick: pickedVersion toWorkingCopy: workingCopy
	| parentVersions parentVersion cherryPick |
	self withUnitOfWork:
	[self flag: #todo. "extract parent selection"
	parentVersions := pickedVersion parents.
	parentVersion := parentVersions size caseOf: {
		[0] -> [nil].
		[1] -> [pickedVersion parents anyOne]}
	otherwise: [SquotGUI
			chooseFrom: (parentVersions collect: #printString)
			values: parentVersions
			title: 'Pick changes in comparison to which parent?'].
	(cherryPick := workingCopy newInteractiveCherryPickOperation)
		requestor: self;
		pickedVersion: pickedVersion;
		relevantParentOfPickedVersion: parentVersion.
	cherryPick applyToWorkingCopy
		whenResolved: [self withUnitOfWork: [self loadCommitList]];
		whenRejected: [:reason | self inform: 'Cherry pick aborted: ', reason]].