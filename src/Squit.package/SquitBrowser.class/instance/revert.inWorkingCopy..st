actions
revert: revertedVersion inWorkingCopy: workingCopy
	| revert |
	self withUnitOfWork:
		[(self soleParentOf: revertedVersion orChooseWithPrompt: 'Revert changes in comparison to which parent?') ifNotNil: [:parentVersion |.
			(revert := workingCopy newInteractiveRevertOperation)
				requestor: self;
				revertedVersion: revertedVersion;
				relevantParentOfRevertedVersion: parentVersion.
			revert applyToWorkingCopy
				whenResolved: [self withUnitOfWork: [self loadCommitList]];
				whenRejected: [:reason | self inform: 'Revert aborted: ', reason]]].