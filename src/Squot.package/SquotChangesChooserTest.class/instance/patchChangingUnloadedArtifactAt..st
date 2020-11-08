test objects
patchChangingUnloadedArtifactAt: path
	^ (SquotWorkingCopy forTestInMemory
		addUnloaded: (SquotArtifactMock new path: path; yourself);
		newPatchBuilder)
			addDiff: ((SquotArtifactDiffMock path: path) willBeLoaded: false; yourself);
			buildPatch