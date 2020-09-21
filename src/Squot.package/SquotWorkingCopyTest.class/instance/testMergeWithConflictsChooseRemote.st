tests
testMergeWithConflictsChooseRemote
	| operation |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	operation := scenario merge.
	scenario
		assertConflictedMethodWorkingEditionPresentIn: operation merge;
		assertConflictedMethodIncomingEditionPresentIn: operation merge;
		assertThirdMethodWillBeAdded: operation merge;
		chooseIncomingEditionOfConflictedMethodIn: operation merge.
	operation applyToWorkingCopy].
	scenario
		assertConflictMethodIncomingEditionLoaded;
		assertThirdMethodLoaded.
	"not saved yet"
	self assert: scenario secondVersion equals: workingCopy loadedVersion.