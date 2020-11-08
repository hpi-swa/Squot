tests
testUnloadedWorkingCopyArtifactsWillNotBeLoaded
	| snapshot1 snapshot2 modification |
	snapshot1 := self createWorkingCopyWithObjectAt: 'obj'.
	(workingCopy objectAt: 'obj') contents: 2.
	snapshot2 := (workingCopy artifactAt: 'obj') capture.
	workingCopy removeAt: 'obj'; addUnloaded: snapshot2.
	modification := SquotArtifactModification left: (workingCopy artifactAt: 'obj') right: snapshot1.
	self deny: modification willBeLoaded;
		applyDiffToWorkingCopy: modification;
		deny: (workingCopy artifactAt: 'obj') isLoaded;
		deny: (workingCopy store includesObjectAt: 'obj');
		assert: snapshot1 equals: (workingCopy artifactAt: 'obj') artifact.