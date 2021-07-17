tests merging
testMergeWithConflictsEditRemovedMethod
	
	| operation |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestPackageChangeAndRemovalScenario forTestCase: self.
	operation := scenario merge.
	scenario
		assertConflictedMethodWorkingEditionPresentIn: operation merge;
		assertConflictedMethodIncomingEditionNotPresentIn: operation merge;
		editConflictedMethodIn: operation merge.
	operation applyToWorkingCopy].
	scenario assertConflictMethodEdited.
	"not saved yet"
	self assert: scenario secondVersion equals: workingCopy loadedVersion.