tests
testMergeGenerated

	<timeout: 20>
	self 
		write: self dummyContents2 
		to: self dummyFile2 
		in: self otherReference.
	self 
		commitOtherMessaged: 'Added dummy2';
		createDummyFile.
	self transferMessaged: 'Added dummy1'.
	self 	
		assert: (self otherCommit tree includesEntryNamed: self dummyFile);
		assert: (self otherCommit tree includesEntryNamed: self dummyFile2).