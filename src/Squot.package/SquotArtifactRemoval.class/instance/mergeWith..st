patching
mergeWith: anArtifactDiff.
	self assert: self path == anArtifactDiff path.
	anArtifactDiff isRemoval ifFalse: [self error: 'Cannot merge a removal with something else.'].
	"When an artifact was removed by the right side, or the to-be-merged version, and it has
	already been removed on the left side, or the target of the merge, then there is nothing left
	to apply."
	^ SquotDiffOfEqualObjects instance