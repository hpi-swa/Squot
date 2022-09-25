merging
mergeWith: anArtifactDiff
	SquotToggles useNewApi ifTrue: [self deprecated].
	self assert: self left artifact "<-- difference to super method" = anArtifactDiff left.
	self assert: self path = anArtifactDiff path.
	"double dispatch"
	^ anArtifactDiff mergeWithLoad: self