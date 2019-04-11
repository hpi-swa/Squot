tests
testPushAddsFile

	<timeout: 60>
	self 
		createDummyFile;
		transferMessaged: 'Created dummy file'.
	self assert: (self otherReference resolve: self dummyFile) exists.