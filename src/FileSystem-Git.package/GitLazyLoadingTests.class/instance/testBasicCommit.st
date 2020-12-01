tests
testBasicCommit		
	repository withUnitOfWork: [
	self assert: (workingCopy / 'newFile') exists not.
	].
	(workingCopy / 'newFile') writeStreamDo: [ :stream | stream nextPutAll: 'testcontent' ].
	self commit: 'test commit'.
	
	repository withUnitOfWork: [
	self assert: (repository head / 'newFile') exists
	].