tests
testNearestMergeBaseWithTag
	| commit1 commit2 tag commitBase |
	"commitBase --- commit2 <-- tag
	                   `--- commit1"
	commitBase := self newCommit: 'base' parents: Array empty.
	commit1 := self newCommit: '1' parents: {commitBase}.
	commit2 := self newCommit: '2' parents: {commitBase}.
	tag := GitTag named: 'test-tag' for: commit2 message: 'this is a test' in: repository.
	self assert: commitBase == (commit1 mergeBaseWithAnyOf: {tag hexHash}).
	self assert: commitBase == (tag mergeBaseWithAnyOf: {commit1 hexHash}).