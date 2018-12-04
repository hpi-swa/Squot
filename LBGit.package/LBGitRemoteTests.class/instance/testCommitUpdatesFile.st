tests
testCommitUpdatesFile

	self commitDummyFileAddition.
	self writeToDummyFile: self dummyContents2.
	self commit: 'Changed dummy file'.

	self 
		assert: 	self dummyContents2
		equals: (self gitReference resolve: self dummyFile) readStream ascii contents withSqueakLineEndings.