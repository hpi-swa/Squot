commit tests
testParentsWithReload
	workingCopy parents isEmpty.
	
	(workingCopy / 'afile') writeStreamDo: [ :stream | ].
	self commit: 'a commit'.
	workingCopy := fsRepository head.
	self withUnitOfWork: [:git |
	self assert: workingCopy parents isEmpty.
	
	(workingCopy / 'anotherfile') writeStreamDo: [ :stream | ].
	self commit: 'commit number 2'.
	workingCopy := fsRepository head.
	self deny: workingCopy parents isEmpty.
	self assert: workingCopy parents size = 1
	].