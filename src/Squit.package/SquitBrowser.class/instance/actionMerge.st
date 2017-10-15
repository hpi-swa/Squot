actions on versions
actionMerge
	| mergeHeadCommit |
	self hasProjectSelection ifFalse: [^ self].
	self hasCommitSelection ifFalse: [^ self].
	mergeHeadCommit := self commitSelection.
	[self mergeVersionIntoActiveBranch: mergeHeadCommit
		ifCanceled: [^ self]]
	on: SquotInitialLogMessageRequested
	do: [:request | request resume: 'Merge commit ', mergeHeadCommit internalId asString,
		' into ', self projectSelection loadedHistorian shortName].
	self selectActiveHistorian.