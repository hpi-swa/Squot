tests
testResolveRef
	| blob resolved |
	blob := (GitBlob bytes: 'test' in: repository) store; yourself.
	self unitOfWork updateRef: 'HEAD' to: blob hexHash.
	
	resolved := self unitOfWork resolveRef: 'HEAD'.
	self assert: blob hexHash = resolved