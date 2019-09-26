private comparing
reverseDiffContentAgainst: otherContent withBase: baseArtifact
	"Triple dispatch with diffContentAgainstThatOf:withBase:"
	"New name suggestions:
	graphMergedWith: otherGraph basedOn: baseArtifact
	mergeGraphWith: otherGraph basedOn: baseArtifact"
	^ baseArtifact asBaseDiff: otherContent against: self content