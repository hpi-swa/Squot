actions
actionCreateGitBranchAtActiveCommit
	| commit branch gitRef |
	commit := self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	branch := UIManager default request: 'Git branch name:'.
	branch isEmptyOrNil ifTrue: [^ self].
	gitRef := 'refs/heads/', branch.
	(self activeWorkingCopy checkRefExists: gitRef displayName: branch) ifTrue: [^ self].
	self unitOfWork
		updateRef: gitRef
		to: commit
		message: 'export from squeak'.