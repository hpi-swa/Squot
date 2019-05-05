tests
testPushAddsFileInNewFolder

	<timeout: 60>
	| folder |
	folder := 'subfolder/'.
	self 
		write: self dummyContents2 
		to: folder, self dummyFile2 
		in: self otherReference;
		transferMessaged: 'Created dummy file in subfolder'.
	self assert: (self otherReference resolve: folder, self dummyFile2) exists.