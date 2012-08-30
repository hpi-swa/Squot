tests
testLoadExistingFiles
	self createSomeCommits.
	
	self assert: (workingCopy root / 'file1') exists.
	self assert: (workingCopy root / 'dir1') exists.
	self assert: (workingCopy root / 'dir1' / 'file2') exists.