commit tests
testModifying
	| ref |	
	self createSomeCommits.
	ref := workingCopy / 'file1'.
	self withUnitOfWork: [:git |
	self assert: ref readStream contents asString = 'content'.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'changed it' ].
	
	self commit: 'a commit'.
	self assert: ref readStream contents asString = 'changed it'.
	self assert: (fsRepository head / 'file1') readStream contents asString = 'changed it'.
	self assert: (fsRepository head parents first / 'file1') readStream contents asString = 'content'
	].