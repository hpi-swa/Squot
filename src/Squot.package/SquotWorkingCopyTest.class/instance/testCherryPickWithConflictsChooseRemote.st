tests
testCherryPickWithConflictsChooseRemote
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
		chooseIncomingEditionOfConflictedMethodIn: merge.
	cherryPick applyMerge.
	scenario assertConflictMethodIncomingEditionLoaded;
		assertThirdMethodLoaded.
	cherryPick save].
	self assert: scenario secondVersion equals: workingCopy loadedVersion parents first;
		deny: scenario thirdVersion = workingCopy loadedVersion;
		assert: 'new version' equals: workingCopy loadedVersion message.