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
		workingCopy toggleWhetherToLoad: (merge at: scenario packageId).
		operation applyToWorkingCopy]].
	"then"
	self assert: (workingCopy artifactAt: scenario packagePath) isLoaded.
	scenario
		assertSecondMethodUnmodifiedWith: self;
		assertThirdMethodLoadedWith: self.
	self assert: scenario originalPackageArtifact id equals: (workingCopy artifactAt: scenario packagePath) id.