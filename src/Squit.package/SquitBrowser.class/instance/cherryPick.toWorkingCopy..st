actions
cherryPick: pickedVersion toWorkingCopy: workingCopy
	| cherryPick |
	self withUnitOfWork:
	[( self soleParentOf: pickedVersion orChooseWithPrompt: 'Pick changes in comparison to which parent?') ifNotNil: [:parentVersion |
		(cherryPick := workingCopy newInteractiveCherryPickOperation)
			requestor: self;
			pickedVersion: pickedVersion;
			relevantParentOfPickedVersion: parentVersion.
		cherryPick applyToWorkingCopy
			whenResolved: [self withUnitOfWork: [self loadCommitList]];
			whenRejected: [:reason | self inform: 'Cherry pick aborted: ', reason]]].