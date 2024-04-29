actions
actionResetToCommit: aCommit
	| headRef |
	headRef := self activeWorkingCopy headRef.
	headRef isSymbolic ifFalse: [self inform: 'Please switch to a branch first.'. ^ false].
	self unitOfWork
		updateRef: headRef name
		to: aCommit
		message: 'reset ', aCommit hexHash.
	^ true