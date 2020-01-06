tests
testOldCherryPickWithoutConflicts
	scenario := SquotSimpleMergeTestScenario forTestCase: self.
	"cherry pick the version of the other historian"
	self suppressChangeNotificationsDuring:
	[[[workingCopy
		cherryPickInteractivelyFromVersion: scenario thirdVersion
		withParent: scenario firstVersion
		ifLoadCanceled: [self fail: 'this code should not be reached']
		ifSaveCanceled: [self fail: 'this code should not be reached']]
	
		on: SquotMergeRequested do: [:request |
			scenario
				assertThirdMethodWillBeAdded: request merge with: self;
				assertSecondMethodUnmodifiedBy: request merge with: self.
			request resume "accept all changes"]
		
		on: SquotSelectionOfChangesRequested do:
			[:request | request message: 'new version'; resume]]
	
		valueSupplyingAnswers: {{'*'. #default}}].
	
	scenario
		assertSecondMethodUnmodifiedWith: self;
		assertThirdMethodLoadedWith: self.
	self assert: scenario secondVersion equals: workingCopy loadedVersion parents first;
		deny: scenario thirdVersion = workingCopy loadedVersion;
		assert: 'new version' equals: workingCopy loadedVersion message.