tests
testStringDefaultEncoding
	| filename string artifactReference |
	string := 'äöü'.
	filename := 'umlauts.txt'.
	fileStore add: (SquotArtifact new
		content: (SquotShadowGraph withSingleShadow:
			(SquotBitsObjectShadow for: string));
		path: filename;
		initializeDefaultStoreInfoFor: string;
		yourself).
	artifactReference := fileStore directory resolve: filename.
	self assert: artifactReference exists description: 'text file not found'.
	self assert: string equals: (artifactReference readStreamDo: [:s | s text contents]).
	self assert: string squeakToUtf8 asByteArray
		equals: (artifactReference readStreamDo: [:s | s binary contents])
		description: 'file not utf-8 encoded'.