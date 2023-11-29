actions
actionCreateGitBranchAtActiveCommitFromRef: aStringOrNil
	| commit branch gitRef |
	commit := self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	branch := self requestBranchNameFor: 'an external branch' fromRef: aStringOrNil.
	branch isEmptyOrNil ifTrue: [^ self].
	gitRef := 'refs/heads/', branch.
	(self activeWorkingCopy checkRefExists: gitRef displayName: branch) ifTrue: [^ self].
	self unitOfWork
		updateRef: gitRef
		to: commit
		message: 'export from squeak'.