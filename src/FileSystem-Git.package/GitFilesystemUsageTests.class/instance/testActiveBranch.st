tests
testActiveBranch
	| masterWorkingCopy |
	self withUnitOfWork: [:git |
	self assert: workingCopy branchName equals: 'master'.
	
	(workingCopy / 'aFile') writeStreamDo: [ :stream | ].
	self branch: 'branch1' message: 'branch 1 commit'.
	self assert: workingCopy branchName equals: 'branch1'.
	].
	
	self withUnitOfWork: [:git |
	git updateHeadToBranch: 'master'.
	self assert: workingCopy branchName equals: 'branch1'. "treat it not as 'the' working copy, but 'a' working copy on branch 1"
	masterWorkingCopy := (FileSystemGitRepository  on: reference) head.
	self assert: masterWorkingCopy branchName equals: 'master'.
		
	(masterWorkingCopy / 'anotherFile') writeStreamDo: [ :stream | ].
	masterWorkingCopy commit: 'a commit'.
	].
	self withUnitOfWork: [:git |
	GitFSCK validate: basicRepository.
	self assert: masterWorkingCopy branchName equals: 'master'
	].