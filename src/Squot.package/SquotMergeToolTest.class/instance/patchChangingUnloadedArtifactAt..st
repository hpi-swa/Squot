test objects
patchChangingUnloadedArtifactAt: path
	| artifact changedArtifact diff |
	artifact := SquotArtifactMock path: path.
	workingCopy := SquotWorkingCopy forTestInMemory
		addUnloaded: artifact;
		yourself.
	changedArtifact := SquotArtifactMock path: path.
	diff := SquotArtifactDiffMock path: path.
	artifact
		whenComparedWith: changedArtifact return: [diff];
		whenComparedWith: (workingCopy artifactAt: path) return: [SquotDiffOfEqualObjects instance];
		whenComparedWith: artifact return: [SquotDiffOfEqualObjects instance].
	diff whenMergedWith: (workingCopy artifactAt: path)
		return: [SquotMergeMock new
					hasConflicts: false;
					incoming: changedArtifact;
					returnAsResolvedPatch: [diff];
					willBeLoaded: false;
					yourself].
	^ SquotMerge
		into: workingCopy
		merge: (SquotSnapshot builder add: changedArtifact; buildSnapshot)
		basedOn: (SquotSnapshot builder add: artifact; buildSnapshot)