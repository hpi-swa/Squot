commit tests
testMoveFile
	| ref newref |	
	self createSomeCommits.
	ref := workingCopy / 'dir1' / 'file2'.
	self assert: ref isFile.
	
	workingCopy rename: ref to: (newref := workingCopy / 'newintermediate' / 'file2').
	self deny: ref exists.
	self assert: newref isFile.
	self assert: newref readStream contents asString = 'more content'.
	
	self commit: 'a commit'.
	self deny: ref exists.
	self assert: newref readStream contents asString = 'more content'.
	self assert: (fsRepository head referenceTo: newref) readStream contents asString = 'more content'.