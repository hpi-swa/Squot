test objects
patchWithUnloadedArtifactAt: path
	| artifact |
	artifact := SquotArtifactMock path: path.
	artifact whenComparedWith: artifact return: [SquotDiffOfEqualObjects instance].
	workingCopy addUnloaded: artifact.
	artifact materializeBlock: [:mock | Object new].
	^ (SquotSnapshot builder add: artifact; buildSnapshot) patchRelativeToBase: workingCopy