actions
actionCreateGitBranchAtActiveCommitFromRef: aStringOrNil
	| commit branch gitRef |
	commit := self activeCommit ifNil: [self inform: 'Please select a commit first.'. ^ nil].
	branch := self requestBranchNameFor: 'an external branch' fromRef: aStringOrNil.
	branch isEmptyOrNil ifTrue: [^ nil].
	gitRef := 'refs/heads/', branch.
	(self activeWorkingCopy checkRefExists: gitRef displayName: branch) ifTrue: [^ nil].
	self unitOfWork
		updateRef: gitRef
		to: commit
		message: 'export from squeak'.
	aStringOrNil ifNotNil: [self checkSetUpstreamForCreatedBranch: gitRef to: aStringOrNil].
	^ gitRef