tests
testAt
	| tree entry blob repo |
	repo := GitRepository on: (FileSystem memory / 'testRepo').
	blob := GitBlob bytes: 'testblob' in: repo.
	blob store.
	entry := GitTreeEntry
		fileNamed: 'testFile'
		hash: blob hash.
	entry repository: repo.
	tree := GitTree entries: {entry} in: repo.
	
	self assert: (tree at: entry entryName) = blob