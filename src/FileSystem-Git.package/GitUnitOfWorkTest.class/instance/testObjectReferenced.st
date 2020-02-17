tests
testObjectReferenced
	| blob resolved |
	blob := (GitBlob bytes: 'test' in: repository) store; yourself.
	repository updateRef: 'HEAD' to: blob hexHash.
	
	resolved := repository objectReferenced: 'HEAD'.
	self assert: blob equals: resolved