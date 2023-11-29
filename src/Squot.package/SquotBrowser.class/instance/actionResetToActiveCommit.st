actions
actionResetToActiveCommit
	| commit headRef |
	commit := self activeCommit ifNil: [self inform: 'Please select a commit first.'. ^ false].
	headRef := self activeWorkingCopy headRef.
	headRef isSymbolic ifFalse: [self inform: 'Please switch to a branch first.'. ^ false].
	self unitOfWork
		updateRef: headRef name
		to: commit.
	^ true