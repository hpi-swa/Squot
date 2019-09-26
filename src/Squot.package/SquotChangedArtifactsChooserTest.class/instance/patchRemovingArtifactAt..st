tests
patchRemovingArtifactAt: path
	| artifact |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	^ SquotPatch builder removeArtifact: artifact; buildPatch.