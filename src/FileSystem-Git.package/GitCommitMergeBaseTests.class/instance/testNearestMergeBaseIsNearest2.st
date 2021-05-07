tests
testNearestMergeBaseIsNearest2
	| commit1 commit2 commit3 commit4 commit5 commit6 commit7 commitBase |
	"commitBase --- commit2 ---- (commit3)
	                   |                  `---- commit4,5 -- commit6 -- [commit7]
	                   `--- commit1 ------------------------´
	There is a long path from commitM to commit2, longer than to commitBase,
	but commit2 is the correct merge base."
	commitBase := self newCommit: 'base' parents: Array empty.
	commit1 := self newCommit: '1' parents: {commitBase}.
	commit2 := self newCommit: '2' parents: {commitBase}.
	commit3 := self newCommit: '3' parents: {commit2}.
	commit4 := self newCommit: '4' parents: {commit2}.
	commit5 := self newCommit: '5' parents: {commit4}.
	commit6 := self newCommit: '6' parents: {commit5. commit1}.
	commit7 := self newCommit: '7' parents: {commit6}.
	self assert: commit2 equals: (commit3 mergeBaseWithAnyOf: {commit7 hexHash}).