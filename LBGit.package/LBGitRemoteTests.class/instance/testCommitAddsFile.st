tests
testCommitAddsFile

	
	self 
		commitDummyFileAddition;
		assert: (self workingCopy loadedVersion commit tree entries includesKey: self dummyFile).