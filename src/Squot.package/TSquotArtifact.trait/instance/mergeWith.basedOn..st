merging
mergeWith: otherArtifact basedOn: baseArtifact
	^ SquotArtifactMerge into: self merge: otherArtifact basedOn: baseArtifact