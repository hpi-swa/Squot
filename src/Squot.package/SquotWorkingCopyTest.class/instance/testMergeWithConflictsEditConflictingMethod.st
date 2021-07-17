tests merging
testMergeWithConflictsEditConflictingMethod
	<timeout: 300>
	| operation |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	operation := scenario merge.
	scenario
		assertConflictedMethodWorkingEditionPresentIn: operation merge;
		assertConflictedMethodIncomingEditionPresentIn: operation merge;
		assertThirdMethodWillBeAdded: operation merge;
		editConflictedMethodIn: operation merge.
	operation applyToWorkingCopy].
	scenario
		assertConflictMethodEdited;
		assertThirdMethodLoaded.
	"not saved yet"
	self assert: scenario secondVersion equals: workingCopy loadedVersion.