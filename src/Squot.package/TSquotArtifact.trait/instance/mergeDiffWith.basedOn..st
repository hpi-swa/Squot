merging
mergeDiffWith: otherArtifact basedOn: baseArtifact
	"New name suggestions:
	mergeWith: otherArtifact basedOn: baseArtifact"
	^ SquotArtifactMerge into: self merge: otherArtifact basedOn: baseArtifact