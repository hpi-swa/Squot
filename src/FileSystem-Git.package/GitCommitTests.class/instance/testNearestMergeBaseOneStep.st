tests
testNearestMergeBaseOneStep
	| tree commit1 commit2 commitBase |
	(tree := GitTree entries: {GitTreeEntry fileNamed: 'fake' hash: 0 in: repository} in: repository) store.
	commitBase := GitCommit withDefaultStamps parents: Array empty; message: 'base';
		tree: tree; repository: repository; store; yourself.
	commit1 := GitCommit withDefaultStamps parents: {commitBase hexHash}; message: '1';
		tree: tree; repository: repository; store; yourself.
	commit2 := GitCommit withDefaultStamps parents: {commitBase hexHash}; message: '2';
		tree: tree; repository: repository; store; yourself.
	self assert: commitBase == (commit1 mergeBaseWithAnyOf: {commit2 hexHash}).
	self assert: commitBase == (commit2 mergeBaseWithAnyOf: {commit1 hexHash}).