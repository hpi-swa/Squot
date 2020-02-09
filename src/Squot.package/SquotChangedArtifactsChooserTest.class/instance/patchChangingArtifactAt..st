test objects
patchChangingArtifactAt: path
	^ (SquotSnapshot builder 
		add: (SquotArtifactMock new path: path; yourself);
		newPatchBuilder)
			addDiff: (SquotArtifactDiffMock path: path);
			buildPatch