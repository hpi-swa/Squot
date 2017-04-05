tests
testChangedBlob
	| blob1 blob2 result tree1 tree2 |
	blob1 := (GitBlob bytes: 'foo' in: repository) store; yourself.
	blob2 := (GitBlob bytes: 'bar' in: repository) store; yourself.
	tree1 := (GitTree entries: {GitTreeEntry fileNamed: 'aFile' hash: blob1 hash in: repository}
			in: repository)
		store;
		yourself.
	tree2 := (GitTree entries: {GitTreeEntry fileNamed: 'aFile' hash: blob2 hash in: repository}
			in: repository)
		store;
		yourself.
	result := diffCreator diffTrees: tree1 and: tree2.
	self assert: (result includesKey: FSPath * 'aFile').
	self assert: (result at: FSPath * 'aFile') leftSide entryHash = blob1 hash.
	self assert: (result at: FSPath * 'aFile') rightSide entryHash = blob2 hash.
	self assert: (result includesKey: FSPath workingDirectory).
	self assert: (result at: FSPath workingDirectory) leftSide entryHash = tree1 hash.
	self assert: (result at: FSPath workingDirectory) rightSide entryHash = tree2 hash.
	self assert: result size = 2.