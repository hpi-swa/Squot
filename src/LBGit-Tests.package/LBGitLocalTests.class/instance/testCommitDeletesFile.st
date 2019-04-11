tests
testCommitDeletesFile

	self 
		commitDummyFileAddition;
		deleteDummyFile;
		commitMessaged: 'Removed dummy file';
		deny: (self commit tree entries includesKey: self dummyFile).