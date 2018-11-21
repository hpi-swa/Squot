commit tests
testTags
	self assert: workingCopy tagNames isEmpty.
	
	(workingCopy / 'afile') writeStreamDo: [ :stream | ].
	self commit: 'commit 1' andTag: 'tag1'.
	self assert: workingCopy tagNames size = 1.
	self assert: (workingCopy tagNames includes: 'tag1').
	
	(workingCopy / 'anotherfile') writeStreamDo: [ :stream | ].
	self commit: 'commit 2' andTag: 'tagNumberTwo'.
	self assert: workingCopy tagNames size = 2.
	self assert: (workingCopy tagNames includes: 'tagNumberTwo').
	
	basicRepository 
		updateRef: basicRepository tagsDir / 'tag3' 
		to: workingCopy revisionHash.
	self assert: workingCopy tagNames size = 3.
	self assert: (workingCopy tagNames includesAllOf: #('tag1' 'tagNumberTwo' 'tag3'))