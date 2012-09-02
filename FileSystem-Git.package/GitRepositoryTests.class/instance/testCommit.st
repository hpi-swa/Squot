tests
testCommit
	| blob tree commit |
	blob := (GitBlob bytes: 'hello' in: repository) store; yourself.
	tree := GitTree
		entries: {(GitTreeEntry fileNamed: 'testFile' hash: blob hash)}
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
		makeFullTag: 'tagtest'
		for: commit
		message: 'First tag'
		tagger: self defaultStamp
		in: repository.
	GitTag makeLightWeightTag: 'light tag' for: commit in: repository.
	repository updateRef: 'HEAD' to: commit hexHash