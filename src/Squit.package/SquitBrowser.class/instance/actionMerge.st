actions on versions
actionMerge
	| mergeHeadCommit workingCopy |
	self hasProjectSelection ifFalse: [^ self].
	self hasCommitSelection ifFalse: [^ self].
	mergeHeadCommit := self commitSelection.
	workingCopy := self projectSelection.
	[self mergeVersionIntoActiveBranch: mergeHeadCommit
		ifCanceled: [^ self]]
	on: SquotInitialLogMessageRequested
	do: [:request | request resume: 'Merge commit ', mergeHeadCommit internalId asString,
		' into ', workingCopy loadedHistorian shortName].
	self selectActiveHistorian.