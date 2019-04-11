tests
testPushDeletedFile

	<timeout: 60>
	self 
		createDummyFile;
		transferMessaged: 'Created dummy file';
		deleteDummyFile;
		transferMessaged: 'Deleted dummy file'.
	self deny: (self otherReference resolve: self dummyFile) exists.