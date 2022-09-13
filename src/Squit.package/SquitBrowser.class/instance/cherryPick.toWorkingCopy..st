actions
cherryPick: pickedVersion toWorkingCopy: workingCopy
	| parentVersion cherryPick |
	self withUnitOfWork:
	[parentVersion := self soleParentOf: pickedVersion orChooseWithPrompt: 'Pick changes in comparison to which parent?'.
	(cherryPick := workingCopy newInteractiveCherryPickOperation)
		requestor: self;
		pickedVersion: pickedVersion;
		relevantParentOfPickedVersion: parentVersion.
	cherryPick applyToWorkingCopy
		whenResolved: [self withUnitOfWork: [self loadCommitList]];
		whenRejected: [:reason | self inform: 'Cherry pick aborted: ', reason]].