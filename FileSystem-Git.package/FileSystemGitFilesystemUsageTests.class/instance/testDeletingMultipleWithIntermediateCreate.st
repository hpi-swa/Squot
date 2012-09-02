commit tests
testDeletingMultipleWithIntermediateCreate
	| ref ref2 |
	self createSomeCommits.
	ref := workingCopy referenceTo: '/a/b/c/d1/e/myFile'.
	ref parent ensureDirectory.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'content' ].
	
	ref2 := workingCopy referenceTo: '/a/b/c/d2/e/myFile'.
	ref2 parent ensureDirectory.
	ref2 writeStreamDo: [ :stream | stream nextPutAll: 'content' ].
	self commit: 'added myFiles'.
	
	ref2 parent delete.
	(workingCopy referenceTo: '/a/b/c/') deleteAll.
	
	self deny: ref exists.
	self deny: ref2 exists.
	
	self commit: 'deleted /a/b/c/'.
	self deny: ref exists.
	self deny: ref2 exists.