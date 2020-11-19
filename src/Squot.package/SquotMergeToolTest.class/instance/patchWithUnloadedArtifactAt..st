test objects
patchWithUnloadedArtifactAt: path
	| artifact |
	artifact := SquotArtifactMock path: path.
	workingCopy addUnloaded: artifact.
	artifact
		whenComparedWith: artifact return: [SquotDiffOfEqualObjects instance];
		whenComparedWith: (workingCopy artifactAt: path) return: [SquotArtifactLoad of: (workingCopy artifactAt: path)].
	artifact materializeBlock: [:mock | Object new].
	^ SquotMerge
		into: workingCopy
		merge: (SquotSnapshot builder add: artifact; buildSnapshot)
		basedOn: (SquotSnapshot builder add: artifact; buildSnapshot)