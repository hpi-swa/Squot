tests
testPushAddsFileToTree

	<timeout: 60>
	self 
		createDummyFile;
		transferMessaged: 'Created dummy file'.
	self assert: (self otherCommit tree entries includesKey: self dummyFile).