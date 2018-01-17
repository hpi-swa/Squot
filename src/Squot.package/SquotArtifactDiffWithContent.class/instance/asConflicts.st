converting
asConflicts
	"Answer a copy in which all differences are conflicts in a merge without a base artifact."
	^ (SquotArtifactDiffWithContentAndBase newFrom: self) privateAsConflicts