merging
resolveConflictWith: aSquotArtifactDiff
	"Since I am an addition, the artifact did not exist in the base snapshot.
	Therefore, the other diff must also be an addition.
	Otherwise, I would be a modification, not an addition.
	Answer the differences between my target state and the other target state."
	^ self right diffAgainst: aSquotArtifactDiff right