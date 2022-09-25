merging
mergeWith: otherArtifact basedOn: baseArtifact
	SquotToggles useNewApi ifTrue: [self deprecated].
	self shouldBeImplemented