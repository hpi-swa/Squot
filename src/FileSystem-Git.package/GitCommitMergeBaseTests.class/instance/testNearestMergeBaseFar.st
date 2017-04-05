tests
testNearestMergeBaseFar
	| commit1 commit2 commit3 commit4 commitBase |
	"commitBase --- commit1 --- commit2 --- commit3
	                    `--- commit4 --- commit5 --- commit6"
	commitBase := self newCommit: 'base' parents: Array empty.
	commit1 := self newCommit: '1' parents: {commitBase}.
	commit2 := self newCommit: '2' parents: {commitBase}.
	commit3 := self newCommit: '3' parents: {commit2}.
	commit4 := self newCommit: '4' parents: {commit2}.
	self assert: commit2 == (commit3 nearestMergeBaseWithAnyOf: {commit4 hexHash}).
	self assert: commit2 == (commit3 nearestMergeBaseWithAnyOf: {commit4 hexHash}).