tests
testDeleteExistingFile
	self createSomeCommits.
	self assert: workingCopy root children size = 2.
	self assert: workingCopy root allChildren size = 4.
	
	workingCopy delete: (workingCopy / 'file1').
	self assert: workingCopy root children size = 1.
	self assert: workingCopy root allChildren size = 3.
	self deny: (workingCopy / 'file1') exists.
	self assert: (workingCopy / 'dir1' / 'file2') exists.
	
	self commit: 'deleted file1'.
	self deny: (workingCopy  / 'file1') exists