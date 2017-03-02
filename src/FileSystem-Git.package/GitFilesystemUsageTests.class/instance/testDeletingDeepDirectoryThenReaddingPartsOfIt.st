commit tests
testDeletingDeepDirectoryThenReaddingPartsOfIt
	| ref1 ref2 commonParent |
	self createSomeCommits.
	ref1 := workingCopy / '1' / '2' / '3' / 'myFile'.
	ref2 := workingCopy / '1' / '2' / '4' / 'secondFile'.
	commonParent := workingCopy / '1' / '2'.
	self deny: ref1 exists.
	self deny: ref1 parent exists.
	
	ref1 parent ensureDirectory.
	ref1 writeStreamDo: [ :stream | stream nextPutAll: 'content' ].
	self assert: ref1 exists.
	self assert: ref1 parent exists.
	ref2 parent ensureDirectory.
	ref2 writeStreamDo: [ :stream | stream nextPutAll: 'different content' ].
	self assert: ref2 exists.
	self assert: ref2 parent exists.
	
	self commit: 'add directory hierarchy'.
	self assert: ref1 exists.
	self assert: ref2 exists.
	
	commonParent deleteAll.
	self deny: ref1 exists.
	self deny: ref1 parent exists.
	self deny: ref2 exists.
	self deny: ref2 parent exists.
	
	commonParent ensureDirectory.
	self assert: commonParent exists.
	self deny: ref1 exists description: 'old file reappeared'.
	self deny: ref2 exists description: 'old file reappeared'.
	
	ref1 parent ensureDirectory.
	ref1 ensureFile.
	self assert: ref1 exists.
	self deny: ref2 exists description: 'old file reappeared'.
	
	self commit: 'added new myDir'.
	self assert: ref1 exists.
	self deny: ref2 exists description: 'old file reappeared'.