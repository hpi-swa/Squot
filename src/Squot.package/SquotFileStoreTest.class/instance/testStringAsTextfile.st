tests
testStringAsTextfile
	| artifactReference |
	fileStore add: (SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotBitsObjectShadow for: 'This is a test'));
		path: 'README.md';
		initializeDefaultStoreInfoFor: 'This is a test';
		yourself).
	artifactReference := fileStore directory resolve: 'README.md'.
	self assert: artifactReference exists description: 'text file not found'.
	self assert: 'This is a test' equals: (artifactReference readStreamDo: [:s | s text contents]).
	self assert: (artifactReference parent / '.README.md.squot-contents') isFile
		description: 'metadata file not found'.
	self assertTableOfContentsExists.
	self assert: 'This is a test'
		equals: (fileStore artifactAt: 'README.md') shadowOfTrackedObject value
		description: 'String not restored correctly'.