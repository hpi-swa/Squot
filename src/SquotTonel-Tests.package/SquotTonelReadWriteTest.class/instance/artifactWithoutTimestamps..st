test data
artifactWithoutTimestamps: anArtifact
	| packageShadow |
	packageShadow := anArtifact shadowOfTrackedObject.
	^ anArtifact copyWithDifferentContent:
		(SquotShadowGraph withSingleShadow:
			(packageShadow copy
				snapshot: (self withoutTimestamps: packageShadow asMCSnapshot);
				yourself))