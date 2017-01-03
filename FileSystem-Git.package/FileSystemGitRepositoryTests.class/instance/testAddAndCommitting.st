tests
testAddAndCommitting
	"when"
	| commit master workingCopy |
	workingCopy := repository branchNamed: 'master'.
	workingCopy / 'README.md' writeStreamDo: [:stream | stream nextPutAll: 'This is a test'; cr].
	workingCopy / 'blob2' writeStreamDo: [:stream | stream nextPutAll: 'foo'].
	commit := workingCopy commit: 'testAddAndCommitting commit'.
	"then"
	master := repository branchNamed: 'master'.
	self assert: 'This is a test', String cr
		equals: (master / 'README.md' readStreamDo: [:stream | stream ascii; contents]).
	self assert: 'foo'
		equals: (master / 'blob2' readStreamDo: [:stream | stream ascii; contents]).
	self assert: 'testAddAndCommitting commit' equals: master revision message.