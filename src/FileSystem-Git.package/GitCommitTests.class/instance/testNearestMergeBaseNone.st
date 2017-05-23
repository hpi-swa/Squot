tests
testNearestMergeBaseNone
	| tree commit1 commit2 |
	(tree := GitTree entries: {GitTreeEntry fileNamed: 'fake' hash: 0 in: repository} in: repository) store.
	commit1 := GitCommit withDefaultStamps parents: {}; message: '1';
		tree: tree; repository: repository; store; yourself.
	commit2 := GitCommit withDefaultStamps parents: {}; message: '2';
		tree: tree; repository: repository; store; yourself.
	self assert: (commit1 mergeBaseWithAnyOf: {commit2 hexHash}) isNil.
	self assert: (commit2 mergeBaseWithAnyOf: {commit1 hexHash}) isNil.