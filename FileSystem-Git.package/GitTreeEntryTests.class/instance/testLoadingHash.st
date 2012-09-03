tests
testLoadingHash
	| hash treeEntry tree |
	hash := SecureHashAlgorithm new hashMessage: #[1 2 3].
	treeEntry := 
		GitTreeEntry
			fileNamed: 'file1' 
			hash: hash
			in: repository.
	tree := GitTree entries: {treeEntry} in: repository.
	tree store.
	
	self assert: (repository objectNamed: tree hexHash) entries anyOne entryHash = hash.
	self assert: (repository objectNamed: tree hexHash) entries anyOne = treeEntry