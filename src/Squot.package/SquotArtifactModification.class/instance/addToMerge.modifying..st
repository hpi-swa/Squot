merging
addToMerge: aMerge modifying: anArtifact
	"Merge my changes without conflicts."
	aMerge addMerge: (anArtifact mergeWith: self right basedOn: self left).