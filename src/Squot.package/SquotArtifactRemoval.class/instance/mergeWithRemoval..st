patching
mergeWithRemoval: anArtifactRemoval
	"When an artifact was removed by the right side, or the to-be-merged version, and it has
	already been removed on the left side, or the target of the merge, then there is nothing left
	to apply."
	"double dispatch, initiated by #mergeWith:"
	^ SquotDiffOfEqualObjects instance