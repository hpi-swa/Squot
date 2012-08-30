tests
testResolveRef
	| blob resolved |
	blob := (GitBlob bytes: 'test' in: repository) store; yourself.
	repository updateRef: 'HEAD' to: blob hexHash.
	
	resolved := repository resolveRef: 'HEAD'.
	self assert: blob hexHash = resolved