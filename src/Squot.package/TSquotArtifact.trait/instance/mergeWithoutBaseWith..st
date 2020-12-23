merging
mergeWithoutBaseWith: anArtifact
	| emptyBase |
	emptyBase := SquotArtifact path: self path content: (SquotShadowGraph withSingleShadow: Object new captureWithSquot).
	^ self mergeWith: anArtifact basedOn: emptyBase