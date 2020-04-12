tests
testOldCherryPickWithConflictsChooseRemote
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeConflictScenario forTestCase: self.
	[[scenario cherryPick]
	
	on: SquotMergeRequested do: [:request | 
		scenario
			assertConflictedMethodWorkingEditionPresentIn: request merge;
			assertConflictedMethodIncomingEditionPresentIn: request merge;
			assertThirdMethodWillBeAdded: request merge;
			chooseIncomingEditionOfConflictedMethodIn: request merge.
		request resume]

	on: SquotSelectionOfChangesRequested do:
		[:request | request message: 'new version'; resume]
	
	] valueSupplyingAnswers: {{'*'. #default}}].
	repository withUnitOfWork:
	[scenario assertConflictMethodIncomingEditionLoaded;
		assertThirdMethodLoaded.
	self assert: scenario secondVersion equals: workingCopy loadedVersion parents first;
		deny: scenario thirdVersion = workingCopy loadedVersion;
		assert: 'new version' equals: workingCopy loadedVersion message].