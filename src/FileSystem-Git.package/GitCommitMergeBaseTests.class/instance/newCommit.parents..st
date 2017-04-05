helpers
newCommit: message parents: parentCommits
	^ GitCommit withDefaultStamps
		parents: (parentCommits collect: #hexHash);
		message: message;
		tree: fakeTree;
		repository: repository;
		store;
		yourself