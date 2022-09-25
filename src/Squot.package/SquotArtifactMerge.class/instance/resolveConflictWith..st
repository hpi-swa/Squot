merging
resolveConflictWith: aSquotArtifactRemoval
	"Since I am not an addition, the artifact existed in the base snapshot.
	Therefore, the other diff also cannot be an addition.
	If the other diff would have been a merge, too, there would be no conflict.
	So, remove my artifact."
	^ aSquotArtifactRemoval