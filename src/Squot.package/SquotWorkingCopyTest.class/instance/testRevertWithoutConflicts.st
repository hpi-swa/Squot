tests reverting
testRevertWithoutConflicts
	| revert merge |
	"revert the addition of method b"
	self suppressChangeNotificationsDuring:
		[scenario := SquotLinearHistoryTestScenario forTestCase: self.
		revert := workingCopy newRevertOperation
			revertedVersion: scenario versionB;
			relevantParentOfRevertedVersion: (repository withUnitOfWork: [scenario versionB parents first]);
			message: 'Revert addition of b'.
		merge := revert prepareMerge.
		self assert: (scenario removesMethodB: merge).
		revert applyMerge.
		self assert: scenario methodBRemoved.
		revert save].
	repository withUnitOfWork:
		[self assert: scenario revertVersionAddedAtEndOfHistory].