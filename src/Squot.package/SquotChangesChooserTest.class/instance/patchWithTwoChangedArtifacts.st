test objects
patchWithTwoChangedArtifacts
	^ (SquotSnapshot builder
		add: (SquotArtifactMock new path: '1'; yourself);
		add: (SquotArtifactMock new path: '2'; yourself);
		newPatchBuilder)
		addDiff: (SquotArtifactDiffMock path: '1');
		addDiff: (SquotArtifactDiffMock path: '2');
		newLoadOrder: #('1' '2');
		updateRightArtifacts;
		buildPatch.