tests
testLoadingHash
	| hash treeEntry tree |
	hash := (GitHash from: #[1 2 3]) hash.
	treeEntry := 
		GitTreeEntry
			fileNamed: 'file1' 
			hash: hash
			in: repository.
	tree := GitTree entries: {treeEntry} in: repository.
	tree store.
	
	self assert: (self unitOfWork objectNamed: tree hexHash) entries anyOne entryHash = hash.
	self assert: (self unitOfWork objectNamed: tree hexHash) entries anyOne = treeEntry