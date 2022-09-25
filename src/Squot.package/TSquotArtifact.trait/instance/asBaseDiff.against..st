private comparing
asBaseDiff: leftArtifactContent against: rightArtifactContent
	"Triple dispatch with diffContentAgainstThatOf:withBase:"
	"New name suggestions:
	mergeGraphAsBaseOf: workingGraph with: incomingGraph
	withGraphAsBaseMerge: workingGraph with: incomingGraph"
	self deprecated.
	^ leftArtifactContent squotMergeWith: rightArtifactContent basedOn: self content