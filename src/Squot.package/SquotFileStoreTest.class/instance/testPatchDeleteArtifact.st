tests
testPatchDeleteArtifact
	| object snapshotWithArtifact snapshotWithoutArtifact artifactReference metadata patch |
	snapshotWithArtifact := SquotSnapshot builder
		add: (SquotArtifact new
			content: (object := 'a text') captureWithSquot;
			path: 'aText';
			initializeDefaultStoreInfoFor: object;
			validatePathFor: object;
			yourself);
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithArtifact.
	artifactReference := fileStore directory resolve: 'aText'.
	self assert: artifactReference exists description: 'artifacts should exist'.
	self assert: (metadata := fileStore metadataForObjectAt: artifactReference) isPresent
		description: 'metadata should exist'.
	snapshotWithoutArtifact := SquotSnapshot builder buildSnapshot.
	patch := snapshotWithoutArtifact patchRelativeToBase: snapshotWithArtifact.
	fileStore applyPatch: patch.
	self deny: artifactReference exists description: 'artifact should not exist'.
	self deny: metadata isPresent description: 'metadata should no longer exist'.