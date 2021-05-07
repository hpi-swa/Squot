running
createFakeTree
	(fakeTree := GitTree
		entries: {GitTreeEntry fileNamed: 'fake' hash: 0 in: repository}
		in: repository)
		store.