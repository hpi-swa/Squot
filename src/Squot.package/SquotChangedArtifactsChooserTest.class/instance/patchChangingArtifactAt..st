tests
patchChangingArtifactAt: path
	^ SquotPatch builder addDiff: (SquotArtifactDiffMock path: path); buildPatch.