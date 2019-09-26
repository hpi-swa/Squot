merging
resolveConflictWith: aSquotArtifactDiff
	"The other diff cannot be a removal because then there would be no conflict."
	^ SquotArtifactAddition of: aSquotArtifactDiff right