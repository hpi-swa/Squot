commit tests
testBranching
	| master branch |
	(workingCopy root / 'aFile') writeStreamDo: [ :stream | ].
	self commit: 'a commit'.
	master := basicRepository objectWithSignature: (basicRepository resolveRef: 'refs/heads/master').
	self assert: master message = 'a commit'.
	self assert: workingCopy branchName = 'master'.
	
	(workingCopy root / 'anotherFile') writeStreamDo: [ :stream | ].
	self branch: 'my fork' message: 'my first branch'.
	branch := basicRepository objectWithSignature: (basicRepository resolveRef: 'refs/heads/my fork').
	self assert: branch message = 'my first branch'.
	self assert: workingCopy branchName = 'my fork'.
	
	self assert: branch parents size = 1.
	self assert: branch parents first = master
	