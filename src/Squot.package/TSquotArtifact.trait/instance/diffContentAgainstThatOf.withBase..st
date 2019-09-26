private comparing
diffContentAgainstThatOf: anArtifact withBase: baseArtifact
	"Triple dispatch with reverseDiffContentAgainst:withBase:"
	"New name suggestions:
	mergeGraphWithThatOf: anArtifact basedOn: baseArtifact"
	^ anArtifact reverseDiffContentAgainst: self content withBase: baseArtifact