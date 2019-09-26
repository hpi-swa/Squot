private
privateResolvedPatch
	^ SquotArtifactModification new
		left: working;
		right: incoming;
		diffContent: graphMerge resolvedPatch;
		updateRightArtifact;
		yourself