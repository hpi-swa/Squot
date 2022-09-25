merging
resolveConflictWith: aSquotArtifactDiff
	"The other diff cannot be a removal because then there would be no conflict."
	^ SquotArtifactAddition of:
		(SquotToggles useNewApi
			ifTrue: [aSquotArtifactDiff "which is a merge" result artifact]
			ifFalse: [aSquotArtifactDiff right])