tests
testPatchDeleteArtifact
	| object snapshotWithArtifact snapshotWithoutArtifact artifactReference metadata patch |
	snapshotWithArtifact := SquotSnapshot builder
		add: (SquotImageStore new
				add: (object := 'a string') at: 'aString.txt';
				artifactAt: 'aString.txt');
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithArtifact.
	artifactReference := fileStore directory resolve: 'aString.txt'.
	self assert: artifactReference exists description: 'artifacts should exist'.
	self assert: (metadata := fileStore metadataForObjectAt: artifactReference) isPresent
		description: 'metadata should exist'.
	snapshotWithoutArtifact := SquotSnapshot builder buildSnapshot.
	patch := snapshotWithoutArtifact patchRelativeToBase: snapshotWithArtifact.
	fileStore applyPatch: patch.
	self deny: artifactReference exists description: 'artifact should not exist'.
	self deny: metadata isPresent description: 'metadata should no longer exist'.