private
privateResolvedPatch
	^ SquotArtifactDiffWithContent new
		left: working;
		right: incoming;
		diffContent: graphMerge resolvedPatch;
		updateRightArtifact;
		yourself