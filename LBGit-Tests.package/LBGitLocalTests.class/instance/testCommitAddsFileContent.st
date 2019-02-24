tests
testCommitAddsFileContent

	
	self 
		commitDummyFileAddition.
	self 
		assert: 	self dummyContents
		equals: (self gitReference resolve: self dummyFile) readStream ascii contents withSqueakLineEndings.