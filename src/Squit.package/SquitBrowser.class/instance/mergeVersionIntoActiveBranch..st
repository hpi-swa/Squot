actions
mergeVersionIntoActiveBranch: mergeHeadCommit
	self projectSelection mergeVersionInteractively: mergeHeadCommit.
	(self projectSelection loadedHistorian version = mergeHeadCommit)
		ifTrue: ["fast-forward merge" ^ self refresh].
	[self actionCommit] on: SquotInitialLogMessageRequested
		do: [:request | request resume: 'Merge ', self branchSelection historian name].
	self refresh.