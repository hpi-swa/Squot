tests reverting
testRevertDoesNotSaveUnrelatedChanges
	| revert merge |
	self suppressChangeNotificationsDuring:
		[scenario := SquotLinearHistoryTestScenario forTestCase: self.
		scenario makeUnrelatedChange.
		revert := workingCopy newRevertOperation
			revertedVersion: scenario versionB;
			relevantParentOfRevertedVersion: (repository withUnitOfWork: [scenario versionB parents first]);
			message: 'Revert b'.
		merge := revert prepareMerge.
		self deny: (scenario updatesUnrelatedChange: merge)
			description: 'unsaved change should be unaffected'.
		revert applyMerge.
		self assert: scenario unrelatedChangeStillLoaded
			description: 'unsaved change should be unaffected by merge'.
		revert save].
	self assert: scenario unrelatedChangeStillLoaded
		description: 'unsaved change should be unaffected by save'.
	self suppressChangeNotificationsDuring:
		[workingCopy discardUnsavedChanges].
	self deny: scenario unrelatedChangeStillLoaded
		description: 'Changes should have been discarded'.