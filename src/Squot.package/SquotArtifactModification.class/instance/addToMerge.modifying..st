merging
addToMerge: aMerge modifying: anArtifact
	"Merge my changes without conflicts."
	SquotToggles useNewApi ifTrue: [self deprecated].
	aMerge addMerge: (anArtifact mergeWith: self right basedOn: self left).