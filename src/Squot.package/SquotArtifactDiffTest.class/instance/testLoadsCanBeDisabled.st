tests
testLoadsCanBeDisabled
	| snapshot load |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	workingCopy
		removeAt: 'obj';
		addUnloaded: snapshot.
	load := SquotArtifactLoad of: (workingCopy artifactAt: 'obj').
	load toggleWhetherToLoad.
	self deny: load willBeLoaded;
		applyDiffToWorkingCopy: load;
		deny: (workingCopy artifactAt: 'obj') isLoaded.