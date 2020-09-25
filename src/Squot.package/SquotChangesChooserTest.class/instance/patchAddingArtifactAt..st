test objects
patchAddingArtifactAt: path
	| artifact |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	^ SquotPatch builder addArtifact: artifact; buildPatch.