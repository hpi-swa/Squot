tests
testReadExistingFile
	self createSomeCommits.
	self withUnitOfWork: [:git |
	self assert: (workingCopy / 'file1') exists.
	self assert: (workingCopy / 'file1') readStream contents asString = 'content'
	].