commit tests
testCommittingWithReload
	(workingCopy / 'aFile') writeStreamDo: [ :stream | ].
	self commit: 'commit 1'.
	self assert: (workingCopy / 'aFile') exists.
	
	workingCopy := fsRepository head.
	(workingCopy / 'file2') writeStreamDo: [ :stream | ].
	self commit: 'commit 2'.
	self assert: (workingCopy / 'file2') exists.
	self assert: (workingCopy / 'aFile') exists