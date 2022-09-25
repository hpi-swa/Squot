merging
mergeDiffWith: otherArtifact basedOn: baseArtifact
	"New name suggestions:
	mergeWith: otherArtifact basedOn: baseArtifact"
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ self mergeWith: otherArtifact basedOn: baseArtifact