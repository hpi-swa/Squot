tests unloaded artifacts
testMergeAndLoadUnloadedArtifact
	| merge operation |
	scenario := SquotSimpleMergeTestScenario forTestCase: self.
	scenario unloadPackage.
	self deny: (workingCopy artifactAt: scenario packagePath) isLoaded.
	"merge the version of the other historian"
	repository withUnitOfWork:
	[self suppressChangeNotificationsDuring:
		[merge := (operation := workingCopy newMergeOperation)
			mergeVersion: scenario thirdVersion;
			prepare.
		(merge at: scenario packagePath) toggleWhetherToLoad.
		operation applyToWorkingCopy]].
	"then"
	self assert: (workingCopy artifactAt: scenario packagePath) isLoaded.
	scenario
		assertSecondMethodUnmodifiedWith: self;
		assertThirdMethodLoadedWith: self.
	self assert: scenario packageId equals: (workingCopy artifactAt: scenario packagePath) id.