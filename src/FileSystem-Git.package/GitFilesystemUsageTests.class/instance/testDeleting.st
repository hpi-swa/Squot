commit tests
testDeleting
	| ref  |
	self createSomeCommits.
	ref := workingCopy / 'myDir' / 'myFile'.
	self deny: ref exists.

	ref parent ensureDirectory.
	ref writeStreamDo: [ :stream | stream nextPutAll: 'content'].
	self assert: ref exists.
	
	self commit: 'added myFile'.
	self withUnitOfWork: [:git |
	self assert: ref exists.
	
	ref delete.
	self assert: ref parent exists.
	self deny: ref exists.
	self assert: ref parent children isEmpty.
	
	self commit: 'deleted myFile'.
	"since refs parent is empty we don't store it anymore"
	self deny: ref parent exists.
	self deny: (workingCopy / 'myDir' / 'anotherFile') exists.
	self deny: ref exists.
	].