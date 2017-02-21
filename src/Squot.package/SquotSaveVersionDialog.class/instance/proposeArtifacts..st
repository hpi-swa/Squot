initialize-release
proposeArtifacts: aSquotSnapshot
	changeChooser addProposedArtifacts: aSquotSnapshot artifacts;
		initializeSelectedChangesWithProposedChanges;
		realizeChangesList.