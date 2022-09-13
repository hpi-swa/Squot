actions
revert: revertedVersion inWorkingCopy: workingCopy
	| parentVersion revert |
	self withUnitOfWork:
		[parentVersion := self soleParentOf: revertedVersion orChooseWithPrompt: 'Revert changes in comparison to which parent?'.
		(revert := workingCopy newInteractiveRevertOperation)
			requestor: self;
			revertedVersion: revertedVersion;
			relevantParentOfRevertedVersion: parentVersion.
		revert applyToWorkingCopy
			whenResolved: [self withUnitOfWork: [self loadCommitList]];
			whenRejected: [:reason | self inform: 'Revert aborted: ', reason]].