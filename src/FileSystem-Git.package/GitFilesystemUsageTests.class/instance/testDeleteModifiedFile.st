tests
testDeleteModifiedFile
	| ref path |
	path := 'dir1/file2'.
	self createSomeCommits.
	
	ref := workingCopy referenceTo: path.
	ref parent ensureDirectory.
	
	ref ensureDeleted writeStreamDo: [ :stream | 
		stream nextPutAll: 'changed it' ].
	
	self assert: ref readStream contents asString = 'changed it'.
	
	ref delete.
	self deny: ref exists.
	self deny: (workingCopy referenceTo: path) exists