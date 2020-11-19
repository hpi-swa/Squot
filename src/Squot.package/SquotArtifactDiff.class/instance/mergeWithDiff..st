merging
mergeWithDiff: anArtifactDiff
	"double dispatch, initiated by #mergeWith:"
	^ anArtifactDiff right mergeDiffWith: self right basedOn: self left