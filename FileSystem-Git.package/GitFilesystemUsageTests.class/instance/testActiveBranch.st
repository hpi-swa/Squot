tests
testActiveBranch
	self assert: workingCopy branchName equals: 'master'.
	
	(workingCopy / 'aFile') writeStreamDo: [ :stream | ].
	self branch: 'branch 1' message: 'branch 1 commit'.
	self assert: workingCopy branchName equals: 'branch 1'.
	
	basicRepository updateHeadToBranch: 'master'.
	self assert: workingCopy branchName equals: 'master'.
	
	(workingCopy / 'anotherFile') writeStreamDo: [ :stream | ].
	self commit: 'a commit'.
	self flag: 'Why do we manually replace the symbolic reference in HEAD?'.
	basicRepository 
		basicUpdateRef: basicRepository headFile 
		to: basicRepository head hexHash.
	self assert: workingCopy branchName equals: 'master'