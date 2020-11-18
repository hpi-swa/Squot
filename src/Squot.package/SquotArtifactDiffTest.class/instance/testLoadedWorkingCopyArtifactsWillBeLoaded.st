tests
testLoadedWorkingCopyArtifactsWillBeLoaded
	| snapshot modification |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	(workingCopy objectAt: 'obj') contents: 2.
	modification := (workingCopy artifactAt: 'obj') diffAgainst: snapshot.
	self assert: modification willBeLoaded;
		applyDiffToWorkingCopy: modification;
		assert: (workingCopy artifactAt: 'obj') isLoaded;
		assert: (workingCopy objectAt: 'obj') contents ~= 2.