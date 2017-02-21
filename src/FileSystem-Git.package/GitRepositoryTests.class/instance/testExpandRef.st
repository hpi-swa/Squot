tests
testExpandRef
	self assert: 'refs/heads/master' equals: (repository expandRef: 'master').
	self assert: 'refs/heads/master' equals: (repository expandRef: 'heads/master').
	self assert: 'refs/heads/master' equals: (repository expandRef: 'refs/heads/master').
	self assert: 'HEAD' equals: (repository expandRef: 'HEAD').