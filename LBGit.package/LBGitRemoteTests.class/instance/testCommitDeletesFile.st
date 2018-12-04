tests
testCommitDeletesFile

	self 
		commitDummyFileAddition;
		deleteDummyFile;
		commit: 'Removed dummy file';
		deny: (self workingCopy loadedVersion commit tree entries includesKey: self dummyFile).