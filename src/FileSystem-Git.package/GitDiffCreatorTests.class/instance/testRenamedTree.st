tests
testRenamedTree
	| blob1 result tree1 parentTree1 parentTree2 |
	blob1 := (GitBlob bytes: 'foo' in: repository) store; yourself.
 	(tree1 := GitTree entries: {blob1 asTreeEntryNamed: 'aFile'} in: repository) store.
	(parentTree1 := GitTree entries: {tree1 asTreeEntryNamed: 'dir1'} in: repository) store.
	(parentTree2 := GitTree entries: {tree1 asTreeEntryNamed: 'dir2'} in: repository) store.
	result := diffCreator diffTrees: parentTree1 and: parentTree2.
	self assert: (result includesKey: FSPath * 'dir1').
	self assert: (result at: FSPath * 'dir1') leftSide entryHash = tree1 hash.
	self assert: (result includesKey: FSPath * 'dir2').
	self assert: (result at: FSPath * 'dir2') rightSide entryHash = tree1 hash.
	self assert: (result includesKey: FSPath workingDirectory).
	self assert: (result includesKey: FSPath * 'dir1' / 'aFile').
	self assert: (result at: FSPath * 'dir1' / 'aFile') leftSide entryHash = blob1 hash.
	self assert: (result includesKey: FSPath * 'dir2' / 'aFile').
	self assert: (result at: FSPath * 'dir2' / 'aFile') rightSide entryHash = blob1 hash.
	self assert: (result at: FSPath workingDirectory) leftSide entryHash = parentTree1 hash.
	self assert: (result at: FSPath workingDirectory) rightSide entryHash = parentTree2 hash.
	self assert: result size = 5.