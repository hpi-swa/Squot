commit tests
testAddingFileSubdir
	| ref filename |
	self assert: workingCopy root children isEmpty.
	
	filename := 'aFile'.
	ref := (workingCopy / 'foo' / 'bar') ensureDirectory / filename.
	self deny: ref exists.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'new file' ].
	self assert: ref exists.
	self assert: (workingCopy / 'foo' / 'bar' / filename) exists.
	self commit: 'a commit'.
	
	self withUnitOfWork: [:git |
	self assert: ref exists.
	self assert: (workingCopy / 'foo' / 'bar' / filename) exists
	].