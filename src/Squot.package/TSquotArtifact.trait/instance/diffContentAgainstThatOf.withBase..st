private comparing
diffContentAgainstThatOf: anArtifact withBase: baseArtifact
	"Triple dispatch with reverseDiffContentAgainst:withBase:"
	"New name suggestions:
	mergeGraphWithThatOf: anArtifact basedOn: baseArtifact"
	self deprecated.
	^ anArtifact reverseDiffContentAgainst: self content withBase: baseArtifact