tests
testObjectReferenced
	| blob resolved |
	blob := (GitBlob bytes: 'test' in: repository) store; yourself.
	self unitOfWork updateRef: 'HEAD' to: blob hexHash.
	
	resolved := repository newUnitOfWork objectReferenced: 'HEAD'.
	self assert: blob equals: resolved