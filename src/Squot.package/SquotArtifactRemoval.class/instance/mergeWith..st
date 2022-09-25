merging
mergeWith: anArtifactDiff
	SquotToggles useNewApi ifTrue: [self deprecated].
	self assert: self left = anArtifactDiff left.
	self assert: self path = anArtifactDiff path.
	"double dispatch"
	^ anArtifactDiff mergeWithRemoval: self