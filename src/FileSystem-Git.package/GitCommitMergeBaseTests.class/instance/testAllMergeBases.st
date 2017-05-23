tests
testAllMergeBases
	| commit1 commit2 commit3 commit4 commitBase |
	"commitBase --- commit2 ---- commit3
	                   |                  `x´
	                   |                  /   \
	                   `--- commit1 ---- commit4"
	commitBase := self newCommit: 'base' parents: Array empty.
	commit1 := self newCommit: '1' parents: {commitBase}.
	commit2 := self newCommit: '2' parents: {commitBase}.
	commit3 := self newCommit: '3' parents: {commit1. commit2}.
	commit4 := self newCommit: '4' parents: {commit1. commit2}.
	self assert: {commit1. commit2} asSet equals: (commit3 allMergeBasesWithAnyOf: {commit4 hexHash}).
	self assert: {commit1. commit2} asSet equals: (commit4 allMergeBasesWithAnyOf: {commit3 hexHash}).
	self assert: ({commit1. commit2} includes: (commit3 mergeBaseWithAnyOf: {commit4 hexHash})).
	self assert: ({commit1. commit2} includes: (commit4 mergeBaseWithAnyOf: {commit3 hexHash})).