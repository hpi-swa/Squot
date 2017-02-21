commit tests
testAddingEmptySubdir
	| ref filename |
	self assert: workingCopy root children isEmpty.
	
	filename := 'aFile'.
	ref := (workingCopy / 'foo' / 'bar') ensureDirectory / filename.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'new file' ].
	self assert: ref exists.
	
	ref := (workingCopy / 'foo' / 'bar2' / 'emptyDir') ensureDirectory.
	self assert: ref exists.
	
	self commit: 'adding empty subdirs'.