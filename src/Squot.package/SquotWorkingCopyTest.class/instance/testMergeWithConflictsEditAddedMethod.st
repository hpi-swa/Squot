tests merging
testMergeWithConflictsEditAddedMethod
	
	| operation |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestPackageRemovalAndChangeScenario forTestCase: self.
	operation := scenario merge.
	scenario
		assertConflictedMethodWorkingEditionNotPresentIn: operation merge;
		assertConflictedMethodIncomingEditionPresentIn: operation merge;
		editConflictedMethodIn: operation merge.
	operation applyToWorkingCopy].
	scenario assertConflictMethodEdited.
	"not saved yet"
	self assert: scenario secondVersion equals: workingCopy loadedVersion.