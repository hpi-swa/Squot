running
run
	self commit: self workingCopy headCommit.
	^ self nextOperation