merging
mergeWithoutBaseWith: anArtifact
	| emptyBase |
	SquotToggles useNewApi ifTrue: [self deprecated].
	emptyBase := SquotArtifact path: self path content: (SquotShadowGraph withSingleShadow: Object new captureWithSquot).
	^ self mergeWith: anArtifact basedOn: emptyBase