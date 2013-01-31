tests
testParseUploadPackResponse
	| reader refs capabilities |
	reader := self newReaderFor: self exampleResponse.
	refs := reader parseUploadPackResponse.
	self assert: refs size equals: 6. "5 refs + capabilities "
	capabilities := refs at: #capabilities.
	self assert: capabilities size equals: 9.
	#('multi_ack' 'thin-pack' 'side-band' 'side-band-64k' 'ofs-delta' 'shallow' 'no-progress' 'include-tag' 'multi_ack_detailed')
		allSatisfy: [:cap | capabilities includes: cap ].
	self assert: (refs at: 'HEAD') equals: '32f1d219977eff6d466950ddb6e086dc7d5f3f4f'.
	self assert: (refs at: 'refs/heads/branch1') equals: '107a203c2b5b5cf25fe759069ea8026a4ad6bcb9'.
	self assert: (refs at: 'refs/heads/master') equals: '32f1d219977eff6d466950ddb6e086dc7d5f3f4f'.
	self assert: (refs at: 'refs/tags/v2') equals: 'c70f1e4ab9f7226e908d27b7ed24651527589a6a'.
	self assert: (refs at: 'refs/tags/v3') equals: '107a203c2b5b5cf25fe759069ea8026a4ad6bcb9'.