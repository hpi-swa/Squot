commit tests
testTags
	self withUnitOfWork: [:git |
	self assert: workingCopy tagNames isEmpty.
	
	(workingCopy / 'afile') writeStreamDo: [ :stream | ].
	self commit: 'commit 1' andTag: 'tag1'.
	self assert: workingCopy tagNames size = 1.
	self assert: (workingCopy tagNames includes: 'tag1').
	
	(workingCopy / 'anotherfile') writeStreamDo: [ :stream | ].
	self commit: 'commit 2' andTag: 'tagNumberTwo'.
	self assert: workingCopy tagNames size = 2.
	self assert: (workingCopy tagNames includes: 'tagNumberTwo').
	
	fsRepository unitOfWork 
		updateRef: 'refs/tags/tag3' 
		to: workingCopy revisionHash;
		updateRef: 'refs/tags/sub/tag4'
		to: workingCopy revisionHash.
	self assert: workingCopy tagNames size = 4.
	self assert: (workingCopy tagNames includesAllOf: #('tag1' 'tagNumberTwo' 'tag3' 'sub/tag4')).
	].