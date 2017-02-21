tests
testBasicCommit		
	self assert: (workingCopy / 'newFile') exists not.
	(workingCopy / 'newFile') writeStreamDo: [ :stream | stream nextPutAll: 'testcontent' ].
	self commit: 'test commit'.
	
	self assert: (repository head / 'newFile') exists