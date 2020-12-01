tests
testUnloadedWorkingCopyArtifactsWillNotBeLoaded2
	| snapshot1 snapshot2 modification |
	snapshot1 := self createWorkingCopyWithObjectAt: 'obj'.
	(workingCopy objectAt: 'obj') contents: 2.
	snapshot2 := (workingCopy artifactAt: 'obj') capture.
	workingCopy removeAt: 'obj'; addUnloaded: snapshot2.
	modification := snapshot1 diffAgainst: (workingCopy artifactAt: 'obj').
	self deny: modification willBeLoaded. "so it will appear as not loaded in diff explorer"