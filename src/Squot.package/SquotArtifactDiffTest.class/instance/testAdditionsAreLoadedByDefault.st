tests
testAdditionsAreLoadedByDefault
	| snapshot |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	workingCopy removeAt: 'obj'.
	self assert: (SquotArtifactAddition of: snapshot) willBeLoaded;
		applyDiffToWorkingCopy: (SquotArtifactAddition of: snapshot);
		assert: (workingCopy artifactAt: 'obj') isLoaded.