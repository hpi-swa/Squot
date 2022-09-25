tests reverting
testRevertOfOrphanedVersion
	"When reverting a version without ancestor, there is no base version. An empty snapshot should be assumed as the base, so everything introduced by the version will be removed during the merge."
	| revert merge |
	self suppressChangeNotificationsDuring:
	[scenario := SquotLinearHistoryTestScenario forTestCase: self.
	revert := workingCopy newRevertOperation
		revertedVersion: scenario versionA1;
		relevantParentOfRevertedVersion: nil; "there is no parent version"
		message: 'Revert addition of a'.
	merge := revert prepareMerge.
	self assert: merge hasConflicts
		description: 'there should be a conflict since the method was later changed again'.
	merge conflicts do: [:each | each chooseIncoming].
	self assert: (SquotToggles useNewApi
			ifTrue: [merge removals notEmpty and: [merge elementMerges isEmpty]]
			ifFalse: [merge resolvedPatch diffs allSatisfy: [:each | each isRemoval]])
		description: 'removes everything'.
	revert applyMerge.
	revert save].
	"then"
	self assert: scenario packageWasRemoved.