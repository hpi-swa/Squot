tests
testNearestMergeBaseFar
	| tree commit1 commit2 commit3 commit4 commitBase |
	"commitBase --- commit1 --- commit2 --- commit3
	                    `--- commit4 --- commit5 --- commit6"
	(tree := GitTree entries: {GitTreeEntry fileNamed: 'fake' hash: 0 in: repository} in: repository) store.
	commitBase := GitCommit withDefaultStamps parents: Array empty; message: 'base';
		tree: tree; repository: repository; store; yourself.
	commit1 := GitCommit withDefaultStamps parents: {commitBase hexHash}; message: '1';
		tree: tree; repository: repository; store; yourself.
	commit2 := GitCommit withDefaultStamps parents: {commitBase hexHash}; message: '2';
		tree: tree; repository: repository; store; yourself.
	commit3 := GitCommit withDefaultStamps parents: {commit2 hexHash}; message: '3';
		tree: tree; repository: repository; store; yourself.
	commit4 := GitCommit withDefaultStamps parents: {commit2 hexHash}; message: '4';
		tree: tree; repository: repository; store; yourself.
	self assert: commit2 == (commit3 mergeBaseWithAnyOf: {commit4 hexHash}).
	self assert: commit2 == (commit3 mergeBaseWithAnyOf: {commit4 hexHash}).