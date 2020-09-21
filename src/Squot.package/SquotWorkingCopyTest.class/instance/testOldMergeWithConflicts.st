tests
testOldMergeWithConflicts
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	[[scenario oldMerge]
	on: SquotMergeRequested do: [:request |
		scenario
			assertConflictedMethodWorkingEditionPresentIn: request merge;
			assertConflictedMethodIncomingEditionPresentIn: request merge;
			assertThirdMethodWillBeAdded: request merge;
			chooseWorkingEditionOfConflictedMethodIn: request merge.
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}].
	scenario assertConflictMethodHasNotChanged;
		assertThirdMethodLoaded.
	"not saved yet"
	self assert: scenario secondVersion equals: workingCopy loadedVersion.