running
abort
	self canAbort ifFalse: [^ self].
	self workingCopy
		updateHeadToAndMaterialize: self originalHeadCommit
		message: 'reset ', self originalHeadCommit hexHash.
	self
		originalHeadCommit: nil;
		inform: 'Rebase aborted.';
		close.