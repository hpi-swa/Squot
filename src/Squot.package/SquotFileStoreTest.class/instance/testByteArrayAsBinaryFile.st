tests
testByteArrayAsBinaryFile
	| bytes filename artifactReference |
	bytes := #[0 0 0 0 1 2 3 4].
	filename := 'stuff.dat'.
	fileStore add: (SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotBitsObjectShadow for: bytes));
		path: filename;
		initializeDefaultStoreInfoFor: bytes;
		yourself).
	artifactReference := fileStore directory resolve: filename.
	self assert: artifactReference exists description: 'file not found'.
	"self assert: bytes equals: (artifactReference readStreamDo: [:s | s binary contents])."
	self assert: (artifactReference parent / '.stuff.dat.squot-contents') isFile
		description: 'metadata file not found'.
	self assertTableOfContentsExists.
	self assert: bytes
		equals: (fileStore artifactAt: filename) shadowOfTrackedObject value
		description: 'bytes not restored correctly'.