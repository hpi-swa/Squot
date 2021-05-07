commit tests
testAddingWithReload
	| ref filename |
	self assert: workingCopy root children isEmpty.
	
	filename := 'aFile'.
	ref := workingCopy / filename.
	self deny: ref exists.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'new file' ].
	self assert: ref exists.
	
	self commit: 'a commit'.
	workingCopy := fsRepository head.
	ref := workingCopy / filename.
	self withUnitOfWork: [:git | self assert: ref exists].