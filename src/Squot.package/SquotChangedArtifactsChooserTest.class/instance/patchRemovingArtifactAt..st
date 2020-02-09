test objects
patchRemovingArtifactAt: path
	| artifact |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	^ (SquotSnapshot builder add: artifact; newPatchBuilder)
		 removeArtifact: artifact;
		buildPatch