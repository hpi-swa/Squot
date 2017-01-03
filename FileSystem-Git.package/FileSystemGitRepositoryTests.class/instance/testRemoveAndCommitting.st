tests
testRemoveAndCommitting
	"when"
	| commit master workingCopy |
	workingCopy := repository branchNamed: 'master'.
	(workingCopy / 'blob2') delete. 
	commit := workingCopy commit: 'testRemoveAndCommitting commit'.
	"then"
	master := repository branchNamed: 'master'.
	self deny: (master / 'blob2') exists.
	self assert: 'testRemoveAndCommitting commit' equals: master revision message.