patching
mergeWith: anArtifactDiff.
	self assert: self left = anArtifactDiff left.
	self assert: self path = anArtifactDiff path.
	"double dispatch"
	^ anArtifactDiff mergeWithRemoval: self