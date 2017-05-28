private comparing
diffContentAgainstThatOf: anArtifact withBase: baseArtifact
	"Triple dispatch with reverseDiffContentAgainst:withBase:"
	^ anArtifact reverseDiffContentAgainst: self content withBase: baseArtifact