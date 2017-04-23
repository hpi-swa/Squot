private comparing
diffContentAgainstThatOf: anArtifact
	"Since I am absent, dispatch with null content"
	"Double dispatch with reverseDiffContentAgainst:"
	^ anArtifact reverseDiffContentAgainst: anArtifact absentContent