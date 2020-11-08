tests
testLoadedWorkingCopyArtifactsWillBeLoaded
	| snapshot modification |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	(workingCopy objectAt: 'obj') contents: 2.
	modification := SquotArtifactModification left: (workingCopy artifactAt: 'obj') right: snapshot.
	self assert: modification willBeLoaded;
		applyDiffToWorkingCopy: modification;
		assert: (workingCopy artifactAt: 'obj') isLoaded;
		assert: (workingCopy objectAt: 'obj') contents ~= 2.