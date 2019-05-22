tests
testPatchFileTreeWithoutMetadata
	| object originalSnapshot patchedSnapshot artifactReference metadata patch |
	"given a file tree with artifacts but without metadata"
	originalSnapshot := SquotSnapshot builder
		add: (SquotImageStore new
				add: (object := 'a string') at: 'aString.txt';
				artifactAt: 'aString.txt');
		buildSnapshot.
	fileStore
		doNotStoreMetadata;
		restoreToSnapshot: originalSnapshot.
	artifactReference := fileStore directory resolve: 'aString.txt'.
	self assert: artifactReference exists description: 'artifacts should exist'.
	self deny: (metadata := fileStore metadataForObjectAt: artifactReference) isPresent
		description: 'metadata should not exist'.
	self deny: fileStore tableOfContentsReference exists description: 'table of contents should not exist'.
	"when applying a patch"
	patchedSnapshot := SquotSnapshot builder
		add: (SquotImageStore new
				add: (object := 'another string') at: 'aString.txt';
				artifactAt: 'aString.txt');
		buildSnapshot.
	patch := patchedSnapshot patchRelativeToBase: originalSnapshot.
	fileStore
		doStoreMetadata;
		applyPatch: patch.
	"then the metadata was written properly"
	self assert: artifactReference exists description: 'artifact should still exist';
		assert: metadata isPresent description: 'metadata should now exist';
		assert: fileStore tableOfContentsReference exists description: 'table of contents exists'.