commit tests
testDeletingMultipleDirectories
	| ref ref2 |
	self createSomeCommits.
	ref := workingCopy referenceTo: '/a/b/c/d1/e/myFile'.
	ref parent ensureDirectory.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'content'].
	self assert: ref exists.
	self assert: ref parent exists.
	
	
	ref2 := workingCopy referenceTo: '/a/b/c/d2/e/myFile'.
	ref2 parent ensureDirectory.
	ref2 writeStreamDo: [ :stream | stream nextPutAll: 'content'].
	self assert: ref2 exists.
	self assert: ref2 parent exists.

	self commit: 'added myFiles'.

	self withUnitOfWork: [:git | ref2 parent delete].
	self commit: 'deleted /a/b/c/d2/e'.
	self withUnitOfWork: [:git |
	self deny: ref2 exists.
	
	(workingCopy referenceTo: '/a/b/c/') delete.
	].
	self commit: 'deleted /a/b/c/'.
	self withUnitOfWork: [:git |
	self deny: ref exists.
	self deny: ref2 exists.
	].