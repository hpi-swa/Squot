tests
testResetWithDeletions
	| ref |
	self createSomeCommits.
	ref := workingCopy / 'file1'.
	self withUnitOfWork: [:git |
	self assert: ref exists.
	
	ref delete.
	self deny: ref exists.
	
	self reset.
	self assert: ref exists
	].