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
	do: [:request | request resume: 'Merge branch ''', mergeHistorian shortName,
		''' into ', self projectSelection loadedHistorian shortName].
	self selectActiveHistorian.