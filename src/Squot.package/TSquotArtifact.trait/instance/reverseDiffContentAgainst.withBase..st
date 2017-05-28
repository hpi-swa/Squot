private comparing
reverseDiffContentAgainst: otherContent withBase: baseArtifact
	"Triple dispatch with diffContentAgainstThatOf:withBase:"
	^ baseArtifact asBaseDiff: otherContent against: self content