tests
testLoadsWillBeLoaded
	| snapshot load |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	workingCopy removeAt: 'obj'; addUnloaded: snapshot.
	load := SquotArtifactLoad of: (workingCopy artifactAt: 'obj').
	self assert: load willBeLoaded;
		applyDiffToWorkingCopy: load;
		assert: (workingCopy artifactAt: 'obj') isLoaded;
		assert: (workingCopy objectAt: 'obj') class = ValueHolder.