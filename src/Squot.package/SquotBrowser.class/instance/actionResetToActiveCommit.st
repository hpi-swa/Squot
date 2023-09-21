actions
actionResetToActiveCommit
	| commit headRef |
	commit := self activeCommit ifNil: [^ self inform: 'Please select a commit first.'].
	headRef := self activeWorkingCopy headRef.
	headRef isSymbolic ifFalse: [^ self inform: 'Please switch to a branch first.'].
	self unitOfWork
		updateRef: headRef name
		to: commit.