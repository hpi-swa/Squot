test objects
patchChangingUnloadedArtifactAt: path
	| artifact changedArtifact diff contentDiff contentMerge |
	artifact := SquotArtifactMock path: path.
	workingCopy addUnloaded: artifact.
	changedArtifact := artifact copy.
	contentDiff := SquotArtifactContentDiffMock new.
	contentMerge := SquotGraphMergeMock resolvedPatch: contentDiff.
	artifact
		whenContentComparedWith: changedArtifact return: [contentDiff];
		whenContentMergedWith: changedArtifact return: [contentMerge].
	diff := SquotArtifactModification left: artifact right: changedArtifact.
	artifact
		whenComparedWith: changedArtifact return: [diff];
		whenComparedWith: (workingCopy artifactAt: path) return: [(SquotArtifactLoad of: (workingCopy artifactAt: path)) toggleWhetherToLoad; yourself];
		whenComparedWith: artifact return: [SquotDiffOfEqualObjects instance];
		whenMergeWith: changedArtifact return: [SquotArtifactMerge into: (workingCopy artifactAt: path) merge: changedArtifact basedOn: artifact].
	^ SquotMerge
		into: workingCopy
		merge: (SquotSnapshot builder add: changedArtifact; buildSnapshot)
		basedOn: (SquotSnapshot builder add: artifact; buildSnapshot)