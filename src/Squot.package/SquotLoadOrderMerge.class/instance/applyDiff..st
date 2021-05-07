patching
applyDiff: aSquotArtifactDiff
	aSquotArtifactDiff applyToContainer: self. "Pose as a container to see which kind of diff this is."