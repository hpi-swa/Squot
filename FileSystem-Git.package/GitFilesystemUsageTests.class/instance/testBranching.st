commit tests
testBranching
	| master branch |
	(workingCopy root / 'aFile') writeStreamDo: [ :stream | ].
	self commit: 'a commit'.
	master := basicRepository objectNamed: (basicRepository resolveRef: 'refs/heads/master').
	self assert: master message equals: 'a commit'.
	self assert: workingCopy branchName equals: 'master'.
	
	(workingCopy root / 'anotherFile') writeStreamDo: [ :stream | ].
	self branch: 'my fork' message: 'my first branch'.
	branch := basicRepository objectNamed: (basicRepository resolveRef: 'refs/heads/my fork').
	self assert: branch message equals: 'my first branch'.
	self assert: workingCopy branchName equals: 'my fork'.
	
	self assert: branch parents size equals: 1.
	self assert: branch parents first equals: master
	