tests
testPushUpdatesFile

	<timeout: 60>
	self 
		createDummyFile;
		transferMessaged: 'Created dummy file';
		writeToDummyFile: self dummyContents2;
		transferMessaged: 'Updated dummy file'.
	self 
		assert: 	self dummyContents2
		equals: (self otherReference resolve: self dummyFile) readStream ascii contents withSqueakLineEndings.