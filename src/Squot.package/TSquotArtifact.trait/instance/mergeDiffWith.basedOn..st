comparing
mergeDiffWith: otherArtifact basedOn: baseArtifact
	^ SquotArtifactDiffWithContentAndBase left: self right: otherArtifact base: baseArtifact