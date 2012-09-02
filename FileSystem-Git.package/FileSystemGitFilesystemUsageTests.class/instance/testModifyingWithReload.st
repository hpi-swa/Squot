commit tests
testModifyingWithReload
	| ref |	
	self createSomeCommits.
	ref := workingCopy / 'file1'.
	self assert: ref readStream contents asString = 'content'.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'changed it' ].
	
	self commit: 'a commit'.
	workingCopy := fsRepository head.
	ref := workingCopy / 'file1'.
	self assert: ref readStream contents asString = 'changed it'