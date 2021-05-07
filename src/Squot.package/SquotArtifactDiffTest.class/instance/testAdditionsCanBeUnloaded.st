tests
testAdditionsCanBeUnloaded
	| snapshot addition |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	workingCopy removeAt: 'obj'.
	addition := SquotArtifactAddition of: snapshot.
	addition toggleWhetherToLoad.
	self deny: addition willBeLoaded;
		applyDiffToWorkingCopy: addition;
		deny: (workingCopy artifactAt: 'obj') isLoaded.