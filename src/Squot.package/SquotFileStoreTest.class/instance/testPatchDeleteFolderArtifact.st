tests
testPatchDeleteFolderArtifact
	| object snapshotWithArtifact snapshotWithoutArtifact artifactReference metadata patch |
	object := PackageInfo new packageName: 'Foo'.
	snapshotWithArtifact := SquotSnapshot builder
		add: ((MCSnapshot fromDefinitions: {MCClassDefinition name: #Foo superclassName: #Object category: 'Foo' instVarNames: #() comment: ''})
			asSquotArtifactForPackage: object);
		buildSnapshot.
	fileStore restoreToSnapshot: snapshotWithArtifact.
	artifactReference := fileStore directory resolve: 'Foo.package'.
	self assert: artifactReference exists description: 'artifacts should exist'.
	self assert: (metadata := fileStore metadataForObjectAt: artifactReference) isPresent
		description: 'metadata should exist'.
	snapshotWithoutArtifact := SquotSnapshot builder buildSnapshot.
	patch := snapshotWithoutArtifact patchRelativeToBase: snapshotWithArtifact.
	fileStore applyPatch: patch.
	self deny: artifactReference exists description: 'artifact should not exist'.
	self deny: metadata isPresent description: 'metadata should no longer exist'.