tests
testActiveBranch
	| masterWorkingCopy |
	self assert: workingCopy branchName equals: 'master'.
	
	(workingCopy / 'aFile') writeStreamDo: [ :stream | ].
	self branch: 'branch1' message: 'branch 1 commit'.
	self assert: workingCopy branchName equals: 'branch1'.
	
	basicRepository updateHeadToBranch: 'master'.
	self assert: workingCopy branchName equals: 'branch1'. "treat it not as 'the' working copy, but 'a' working copy on branch 1"
	masterWorkingCopy := (FileSystemGitRepository  on: reference) head.
	self assert: masterWorkingCopy branchName equals: 'master'.
		
	(masterWorkingCopy / 'anotherFile') writeStreamDo: [ :stream | ].
	masterWorkingCopy commit: 'a commit'.
	GitFSCK validate: basicRepository.
	self assert: masterWorkingCopy branchName equals: 'master'