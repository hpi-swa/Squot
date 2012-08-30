tests
testDetachingWorkingCopy
	self createSomeCommits.
	self assert: (workingCopy / 'dir1') exists.
	self assert: (workingCopy / 'file1') exists.
	self assert: (workingCopy / 'dir1' / 'file2') exists.
	self deny: workingCopy parents isEmpty.

	workingCopy detachWorkingCopy.
	self deny: (workingCopy / 'dir1') exists.
	self deny: (workingCopy / 'file1') exists.
	self deny: (workingCopy / 'dir1' / 'file2') exists.
	self deny: workingCopy parents isEmpty.
	
	workingCopy := fsRepository head.
	(workingCopy / 'file1') writeStreamDo: [ :stream | stream nextPutAll: 'remaining change' ].
	
	workingCopy detachWorkingCopy.
	self deny: (workingCopy / 'dir1') exists.
	self deny: (workingCopy / 'dir1' / 'file2') exists.
	self deny: (workingCopy / 'file1') exists.
	self deny: workingCopy parents isEmpty