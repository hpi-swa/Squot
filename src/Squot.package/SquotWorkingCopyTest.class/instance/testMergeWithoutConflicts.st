tests
testMergeWithoutConflicts
	| operation merge |
	scenario := SquotSimpleMergeTestScenario forTestCase: self.
	"merge the version of the other historian"
	repository withUnitOfWork:
	[self suppressChangeNotificationsDuring:
		[merge := (operation := workingCopy newMergeOperation)
			mergeVersion: scenario thirdVersion;
			prepare.
		scenario
			assertThirdMethodWillBeAdded: merge with: self;
			assertSecondMethodUnmodifiedBy: merge with: self.
		operation applyToWorkingCopy].

	scenario
		assertSecondMethodUnmodifiedWith: self;
		assertThirdMethodLoadedWith: self.
	self assert: scenario secondVersion equals: workingCopy loadedVersion;
		assert: (workingCopy additionalParents includes: scenario thirdVersion)].