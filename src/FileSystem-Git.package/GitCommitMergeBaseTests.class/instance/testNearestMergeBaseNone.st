tests
testNearestMergeBaseNone
	| commit1 commit2 |
	commit1 := self newCommit: '1' parents: Array empty.
	commit2 := self newCommit: '2' parents: Array empty.
	self assert: (commit1 mergeBaseWithAnyOf: {commit2 hexHash}) isNil.
	self assert: (commit2 mergeBaseWithAnyOf: {commit1 hexHash}) isNil.