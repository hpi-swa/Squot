tests
testReadArtifactWithoutMetadata
	| object originalSnapshot artifact metadataFile readSnapshot artifactReference metadata |
	"given a file tree with artifacts but without their metadata"
	originalSnapshot := (SquotImageStore new
							add: (object := TestCase packageInfo) at: 'src/SUnit.package';
							captureSnapshot).
	artifact := originalSnapshot artifacts anyOne.
	fileStore restoreToSnapshot: originalSnapshot.
	self assert: (metadataFile := (fileStore metadataFor: artifact) metadataFile) isFile
		description: 'metadata should have been written initially'.
	metadataFile delete.
	artifactReference := fileStore directory resolve: artifact path.
	self assert: artifactReference exists description: 'artifacts should exist';
		deny: (metadata := fileStore metadataForObjectAt: artifactReference) isPresent
		description: 'metadata should not exist';
		assert: fileStore tableOfContentsReference exists
		description: 'table of contents should exist'.
	"when reading the snapshot"
	readSnapshot := fileStore captureLazySnapshot.
	"then the artifact is accessible"
	self assert: artifact shadowOfTrackedObject undecorated
		equals: (readSnapshot artifactAt: artifact path) shadowOfTrackedObject.