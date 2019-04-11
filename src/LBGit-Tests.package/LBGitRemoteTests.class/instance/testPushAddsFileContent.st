tests
testPushAddsFileContent

	<timeout: 60>
	self 
		createDummyFile;
		transferMessaged: 'Created dummy file'.
	self 
		assert: 	self dummyContents
		equals: (self otherReference resolve: self dummyFile) readStream ascii contents withSqueakLineEndings.