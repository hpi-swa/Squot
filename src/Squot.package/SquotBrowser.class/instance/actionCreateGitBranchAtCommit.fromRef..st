actions
actionCreateGitBranchAtCommit: aCommit fromRef: aStringOrNil
	| branch gitRef |
	branch := self requestBranchNameFor: 'an external branch' at: aCommit fromRef: aStringOrNil.
	branch isEmptyOrNil ifTrue: [^ nil].
	gitRef := 'refs/heads/', branch.
	(self activeWorkingCopy checkRefExists: gitRef displayName: branch) ifTrue: [^ nil].
	self unitOfWork
		updateRef: gitRef
		to: aCommit
		message: 'export from squeak'.
	aStringOrNil ifNotNil: [self checkSetUpstreamForCreatedBranch: gitRef to: aStringOrNil].
	^ gitRef