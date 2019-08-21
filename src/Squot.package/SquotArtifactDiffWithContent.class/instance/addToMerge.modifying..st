merging
addToMerge: aMerge modifying: anArtifact
	"Merge my changes without conflicts."
	aMerge addMerge:
		(SquotArtifactMerge into: anArtifact 
			merge: self right
			basedOn: self left).