running
run
	self rebase refsToUpdate at: self ref put: self workingCopy headCommit.
	^ self nextOperation