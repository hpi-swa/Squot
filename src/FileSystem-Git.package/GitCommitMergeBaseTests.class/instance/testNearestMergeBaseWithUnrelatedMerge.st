tests
testNearestMergeBaseWithUnrelatedMerge
	| commit1 commit2 commit3 commit4 commit5 commitBase |
	"commitBase --- commit2 ---- commit3 ---- commit5
	                   |                  `---- commit4 ----´
	                   `--- commit1"
	commitBase := self newCommit: 'base' parents: Array empty.
	commit1 := self newCommit: '1' parents: {commitBase}.
	commit2 := self newCommit: '2' parents: {commitBase}.
	commit3 := self newCommit: '3' parents: {commit2}.
	commit4 := self newCommit: '4' parents: {commit2}.
	commit5 := self newCommit: '5' parents: {commit3. commit4}.
	self assert: commitBase equals: (commit5 mergeBaseWithAnyOf: {commit1 hexHash}).
	self assert: commitBase equals: (commit1 mergeBaseWithAnyOf: {commit5 hexHash}).