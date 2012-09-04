tests
testCommit
	| blob tree commit |
	blob := (GitBlob bytes: 'hello' in: repository) store; yourself.
	tree := GitTree
		entries: {(GitTreeEntry fileNamed: 'testFile' hash: blob hash in: repository)}
		in: repository.
	tree store.
	commit := (GitCommit in: repository)
		author: self defaultStamp;
		committer: self defaultStamp;
		tree: tree;
		message: 'initial commit';
		store;
		yourself.
	GitTag
		named: 'tagtest'
		for: commit
		message: 'First tag'
		tagger: self defaultStamp
		in: repository.
	GitLightweightTag 
		named: 'light tag' 
		for: commit 
		in: repository.
	repository updateRef: 'HEAD' to: commit hexHash