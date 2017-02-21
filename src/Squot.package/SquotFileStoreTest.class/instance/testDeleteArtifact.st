tests
testDeleteArtifact
	| object snapshotWithArtifact snapshotWithoutArtifact artifactReference |
	snapshotWithArtifact := SquotSnapshot builder
		add: (SquotArtifact new
			content: (object := 1 @ 2);
			path: 'aPoint';
			initializeDefaultStoreInfoFor: object;
			validatePathFor: object;
			yourself);
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithArtifact.
	artifactReference := fileStore directory resolve: 'aPoint'.
	self assert: artifactReference exists description: 'artifacts should exist'.
	snapshotWithoutArtifact := SquotSnapshot builder
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithoutArtifact.
	self deny: artifactReference exists description: 'artifact should not exist'.