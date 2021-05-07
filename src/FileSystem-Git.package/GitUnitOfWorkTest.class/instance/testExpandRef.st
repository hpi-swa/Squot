tests
testExpandRef
	self assert: 'refs/heads/master' equals: (self unitOfWork expandRef: 'master').
	self assert: 'refs/heads/master' equals: (self unitOfWork expandRef: 'heads/master').
	self assert: 'refs/heads/master' equals: (self unitOfWork expandRef: 'refs/heads/master').
	self assert: 'HEAD' equals: (self unitOfWork expandRef: 'HEAD').