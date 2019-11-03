test objects
patchWithTwoChangedArtifacts
	^ SquotPatch builder
		addDiff: (SquotArtifactDiffMock path: '1');
		addDiff: (SquotArtifactDiffMock path: '2');
		newLoadOrder: #('1' '2');
		buildPatch.