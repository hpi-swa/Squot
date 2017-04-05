tests
testChangedBlobInSubtree
	| blob1 blob2 result tree1 tree2 parentTree1 parentTree2 |
	blob1 := (GitBlob bytes: 'foo' in: repository) store; yourself.
	blob2 := (GitBlob bytes: 'bar' in: repository) store; yourself.
	(tree1 := GitTree entries: {GitTreeEntry fileNamed: 'aFile' hash: blob1 hash in: repository}
			in: repository) store.
	(tree2 := GitTree entries: {GitTreeEntry fileNamed: 'aFile' hash: blob2 hash in: repository}
			in: repository) store.
	(parentTree1 := GitTree entries: {GitTreeEntry directoryNamed: 'dir' hash: tree1 hash in: repository} in: repository) store.
	(parentTree2 := GitTree entries: {GitTreeEntry directoryNamed: 'dir' hash: tree2 hash in: repository} in: repository) store.
	result := diffCreator diffTrees: parentTree1 and: parentTree2.
	self assert: (result includesKey: FSPath * 'dir' / 'aFile').
	self assert: (result at: FSPath * 'dir' / 'aFile') leftSide entryHash = blob1 hash.
	self assert: (result at: FSPath * 'dir' / 'aFile') rightSide entryHash = blob2 hash.
	self assert: (result includesKey: FSPath * 'dir').
	self assert: (result at: FSPath * 'dir') leftSide entryHash = tree1 hash.
	self assert: (result at: FSPath * 'dir') rightSide entryHash = tree2 hash.
	self assert: (result includesKey: FSPath workingDirectory).
	self assert: (result at: FSPath workingDirectory) leftSide entryHash = parentTree1 hash.
	self assert: (result at: FSPath workingDirectory) rightSide entryHash = parentTree2 hash.
	self assert: result size = 3.