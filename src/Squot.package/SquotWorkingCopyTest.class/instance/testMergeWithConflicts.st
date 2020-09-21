tests
testMergeWithConflicts
	| operation |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	operation := scenario merge.
	scenario
		assertConflictedMethodWorkingEditionPresentIn: operation merge;
		assertConflictedMethodIncomingEditionPresentIn: operation merge;
		assertThirdMethodWillBeAdded: operation merge;
		chooseWorkingEditionOfConflictedMethodIn: operation merge.
	operation applyToWorkingCopy].
	scenario assertConflictMethodHasNotChanged;
		assertThirdMethodLoaded.
	"not saved yet"
	self assert: scenario secondVersion equals: workingCopy loadedVersion.