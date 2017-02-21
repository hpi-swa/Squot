tests
testObjectNamed
	| initialBlob loadedBlob |
	initialBlob := (GitBlob bytes: 'test' in: repository) store; yourself.
	loadedBlob := repository objectNamed: initialBlob hexHash.
	self assert: initialBlob = loadedBlob