commit tests
testMoveDirectory
	| ref newref |	
	self createSomeCommits.
	ref := workingCopy / 'dir1'.
	self withUnitOfWork: [:git |
	self assert: ref isDirectory.
	
	workingCopy rename: ref to: (newref := workingCopy / 'newintermediate' / 'newlocation').
	self deny: ref exists.
	self assert: newref isDirectory.
	self assert: (newref / 'file2') isFile. "from createSomeCommits"
	self assert: (newref / 'file2') readStream contents asString = 'more content'.
	
	self commit: 'a commit'.
	self deny: ref exists.
	self assert: newref isDirectory.
	self assert: (newref / 'file2') readStream contents asString = 'more content'.
	self assert: (fsRepository head referenceTo: newref) isDirectory.
	self assert: (fsRepository head referenceTo: newref / 'file2') readStream contents asString = 'more content'.
	].