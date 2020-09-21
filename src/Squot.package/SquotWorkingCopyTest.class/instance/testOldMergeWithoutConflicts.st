tests
testOldMergeWithoutConflicts
	scenario := SquotSimpleMergeTestScenario forTestCase: self.
	"merge the version of the other historian"
	repository withUnitOfWork:
	[self suppressChangeNotificationsDuring:
	[[[workingCopy
		mergeVersionInteractively: scenario thirdVersion
		ifCanceled: [self fail: 'this code should not be reached']]
	
		on: SquotMergeRequested do: [:request |
			scenario
				assertThirdMethodWillBeAdded: request merge with: self;
				assertSecondMethodUnmodifiedBy: request merge with: self.
			request resume "accept all changes"]]
		valueSupplyingAnswers: {{'*'. #default}}].

	scenario
		assertSecondMethodUnmodifiedWith: self;
		assertThirdMethodLoadedWith: self.
	self assert: scenario secondVersion equals: workingCopy loadedVersion].