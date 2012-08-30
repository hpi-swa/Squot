commit tests
testDeletingDirectory
	| ref |
	self createSomeCommits.
	ref := workingCopy / 'myDir' / 'myFile'.
	self deny: ref exists.
	self deny: ref parent exists.
	
	ref parent ensureDirectory.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'content' ].
	self assert: ref exists.
	self assert: ref parent exists.
	
	self commit: 'added myDir'.
	self assert: ref exists.
	self assert: ref parent exists.
	
	ref parent delete.
	self deny: ref exists.
	self deny: ref parent exists.
	
	self commit: 'removed myDir'.
	self deny: ref parent exists.
	self deny: ref exists.