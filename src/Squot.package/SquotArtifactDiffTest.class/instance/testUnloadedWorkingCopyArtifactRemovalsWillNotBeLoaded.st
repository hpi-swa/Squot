tests
testUnloadedWorkingCopyArtifactRemovalsWillNotBeLoaded
	| snapshot removal |
	snapshot := self createWorkingCopyWithObjectAt: 'obj'.
	workingCopy removeAt: 'obj'; addUnloaded: snapshot.
	removal := SquotArtifactRemoval of: (workingCopy artifactAt: 'obj').
	self deny: removal willBeLoaded;
		applyDiffToWorkingCopy: removal;
		deny: (workingCopy includesObjectAt: 'obj'). "Ideally would assert that the object was not materialized in the meantime."