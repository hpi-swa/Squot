private comparing
asBaseDiff: leftArtifactContent against: rightArtifactContent
	"Triple dispatch with diffContentAgainstThatOf:withBase:"
	^ leftArtifactContent squotDiffAgainst: rightArtifactContent withBase: self content