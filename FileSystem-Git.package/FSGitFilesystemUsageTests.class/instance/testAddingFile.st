commit tests
testAddingFile
	| ref filename |
	self assert: workingCopy root children isEmpty.
	
	filename := 'aFile'.
	ref := workingCopy / filename.
	self deny: ref exists.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'new file' ].
	self assert: ref exists.
	self assert: (workingCopy / filename) exists.
	self commit: 'a commit'.
	
	self assert: ref exists.
	self assert: (workingCopy / filename) exists