test objects
patchAddingArtifactAt: path
	| artifact |
	artifact := SquotArtifact new path: path; content: SquotArtifactContentMock new.
	^ SquotPatch builder addDiff: (SquotArtifactAddition of: artifact); updateRightArtifacts; buildPatch.