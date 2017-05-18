tests
testHeadRef
	repository updateHeadToBranch: 'master'.
	self assert: 'refs/heads/master' equals: repository headRef.
	repository updateHeadToBranch: 'branch1'.
	self assert: 'refs/heads/branch1' equals: repository headRef.
	repository basicUpdateRef: 'HEAD' to: (repository resolveRef: 'master'). "detached HEAD"
	self assert: (repository resolveRef: 'master') equals: repository headRef.