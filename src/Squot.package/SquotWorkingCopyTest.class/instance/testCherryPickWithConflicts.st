tests cherry picking
testCherryPickWithConflicts
	| cherryPick merge |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	cherryPick := workingCopy newCherryPickOperation
		pickedVersion: scenario thirdVersion;
		relevantParentOfPickedVersion: scenario firstVersion;
		message: 'new version'.
	merge := cherryPick prepareMerge.
	scenario
		assertConflictedMethodWorkingEditionPresentIn: merge;
		assertConflictedMethodIncomingEditionPresentIn: merge;
		assertThirdMethodWillBeAdded: merge;
		chooseWorkingEditionOfConflictedMethodIn: merge.
	cherryPick applyMerge.
	scenario
		assertConflictMethodHasNotChanged;
		assertThirdMethodLoaded.
	cherryPick save].
	repository withUnitOfWork:
	[self assert: scenario secondVersion equals: workingCopy loadedVersion parents first;
		deny: scenario thirdVersion = workingCopy loadedVersion;
		assert: 'new version' equals: workingCopy loadedVersion message].