actions on branches
actionBranchMerge
	| mergeHistorian mergeHeadCommit |
	self hasProjectSelection ifFalse: [^ self].
	self hasBranchSelection ifFalse: [^ self].
	mergeHistorian := selectedHistorian.
	mergeHeadCommit := mergeHistorian version.
	[self mergeVersionIntoActiveBranch: mergeHeadCommit
		ifCanceled: [^ self]]
	on: SquotInitialLogMessageRequested
	do: [:request | request resume:
			(mergeHistorian messageWhenMergingInto: self projectSelection loadedHistorian)].
	self selectActiveHistorian.