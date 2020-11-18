test objects
patchChangingUnloadedArtifactAt: path
	| artifact changedArtifact diff contentDiff contentMerge |
	artifact := SquotArtifactMock path: path.
	workingCopy := SquotWorkingCopy forTestInMemory
		addUnloaded: artifact;
		yourself.
	changedArtifact := artifact copy.
	diff := SquotArtifactDiffMock path: path.
	artifact
		whenComparedWith: changedArtifact return: [diff];
		whenComparedWith: (workingCopy artifactAt: path) return: [SquotDiffOfEqualObjects instance];
		whenComparedWith: artifact return: [SquotDiffOfEqualObjects instance].
	contentDiff := SquotDiffMock new.
	contentMerge := SquotGraphMergeMock resolvedPatch: contentDiff.
	artifact whenContentComparedWith: changedArtifact return: [contentMerge].
	diff whenMergedWith: (workingCopy artifactAt: path)
		return: [SquotArtifactMerge
					into: (workingCopy artifactAt: path)
					merge: changedArtifact
					basedOn: artifact]
					"hasConflicts: false;
					incoming: changedArtifact;
					returnAsResolvedPatch: [diff];
					willBeLoaded: false;
					yourself]".
	^ SquotMerge
		into: workingCopy
		merge: (SquotSnapshot builder add: changedArtifact; buildSnapshot)
		basedOn: (SquotSnapshot builder add: artifact; buildSnapshot)