actions
actionMerge
	| mergeHeadCommit |
	self hasProjectSelection ifFalse: [^ self].
	self hasCommitSelection ifFalse: [^ self].
	mergeHeadCommit := self commitSelection.
	[self mergeVersionIntoActiveBranch: mergeHeadCommit]
		on: SquotInitialLogMessageRequested
		do: [:request | request resume: 'Merge commit ', mergeHeadCommit internalId asString,
			' into ', self projectSelection loadedHistorian shortName].