merging
mergeWith: anArtifactDiff
	self assert: self left artifact "<-- difference to super method" = anArtifactDiff left.
	self assert: self path = anArtifactDiff path.
	"double dispatch"
	^ anArtifactDiff mergeWithLoad: self