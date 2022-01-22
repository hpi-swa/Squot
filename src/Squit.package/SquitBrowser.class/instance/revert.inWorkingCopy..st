actions
revert: revertedVersion inWorkingCopy: workingCopy
	| parentVersions parentVersion revert |
	self withUnitOfWork:
		[self flag: #todo. "extract parent selection"
		parentVersions := revertedVersion parents.
		parentVersion := parentVersions size caseOf: {
			[0] -> [nil].
			[1] -> [revertedVersion parents anyOne]}
		otherwise: [SquotGUI
				chooseFrom: (parentVersions collect: #printString)
				values: parentVersions
				title: 'Revert changes in comparison to which parent?'].
		(revert := workingCopy newInteractiveRevertOperation)
			requestor: self;
			revertedVersion: revertedVersion;
			relevantParentOfRevertedVersion: parentVersion.
		revert applyToWorkingCopy
			whenResolved: [self withUnitOfWork: [self loadCommitList]];
			whenRejected: [:reason | self inform: 'Revert aborted: ', reason]].