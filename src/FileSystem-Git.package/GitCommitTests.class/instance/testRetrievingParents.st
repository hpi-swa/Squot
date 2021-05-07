tests
testRetrievingParents
	| commit |
	commit := repository unitOfWork head.
	
	self assert: commit tree entries size = 3.
	self assert: commit parents size = 2.
	self assert: commit parents first tree entries size = 2.
	self assert: (commit parents first tree entries anySatisfy: [ :entry |
		entry entryName = 'file1' ]).
	self assert: (commit parents first tree entries anySatisfy: [ :entry |
		entry entryName = 'file2' ]).
	self assert: commit parents second tree entries size = 1.
	self assert: (commit parents second tree entries anySatisfy: [ :entry |
		entry entryName = 'file1' ])