commit tests
testDeletingDirectoryThenReaddingIt
	| ref |
	self createSomeCommits.
	ref := workingCopy / 'myDir' / 'myFile'.
	self deny: ref exists.
	self deny: ref parent exists.
	
	ref parent ensureDirectory.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'content' ].
	self assert: ref exists.
	self assert: ref parent exists.
	
	self commit: 'added myDir'.
	self assert: ref exists.
	self assert: ref parent exists.
	
	ref parent delete.
	self deny: ref exists.
	self deny: ref parent exists.
	
	ref parent ensureDirectory.
	self assert: ref parent exists.
	self deny: ref exists description: 'old file reappeared'.
	
	self commit: 'removed myDir'.
	"since the new directory was empty, it was not stored at all"
	self deny: ref exists description: 'old file reappeared'.
	
	ref parent ensureDirectory.
	(ref parent / 'anotherFile') ensureFile.
	self deny: ref exists description: 'old file reappeared'.
	
	self commit: 'added new myDir'.
	self assert: ref parent exists.
	self assert: (ref parent / 'anotherFile') exists.
	self deny: ref exists description: 'old file reappeared'.