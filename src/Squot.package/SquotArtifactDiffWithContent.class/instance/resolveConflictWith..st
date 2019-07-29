merging
resolveConflictWith: aSquotArtifactDiff
	"Since I am not an addition, the artifact existed in the base snapshot.
	Therefore, the other diff also cannot be an addition.
	The solution depends on whether the chosen (other) diff is a removal or another change."
	self flag: #TODO. "actually, the other side must be a removal because two modifications will not produce a container conflict, will they?"
	^ aSquotArtifactDiff resolveConflictByPatching: self right