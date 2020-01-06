tests
testCherryPickWithoutConflicts
	| cherryPick merge |
	"cherry pick the version of the other historian"
	self suppressChangeNotificationsDuring:
	[scenario := SquotSimpleMergeTestScenario forTestCase: self.
	cherryPick := workingCopy newCherryPickOperation
		pickedVersion: scenario thirdVersion;
		relevantParentOfPickedVersion: scenario firstVersion;
		message: 'new version'.
	merge := cherryPick prepareMerge.
	scenario
		assertThirdMethodWillBeAdded: merge with: self;
		assertSecondMethodUnmodifiedBy: merge with: self.
	cherryPick applyMerge.
	scenario
		assertSecondMethodUnmodifiedWith: self;
		assertThirdMethodLoadedWith: self.
	cherryPick save].
	self assert: scenario secondVersion equals: workingCopy loadedVersion parents first;
		deny: scenario thirdVersion = workingCopy loadedVersion;
		assert: 'new version' equals: workingCopy loadedVersion message.