tests
testAt
	| tree entry blob repo |
	repo := GitRepository on: (FileSystem memory / 'testRepo').
	blob := GitBlob bytes: 'testblob' in: repo.
	repo withUnitOfWork: [blob store].
	entry := GitTreeEntry
		fileNamed: 'testFile'
		hash: blob hash
		in: repo.
	tree := GitTree entries: {entry} in: repo.
	
	repo withUnitOfWork: [self assert: (tree at: entry entryName) = blob].