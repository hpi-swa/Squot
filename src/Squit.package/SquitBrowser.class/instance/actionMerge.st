actions
actionMerge
	| mergeHeadCommit |
	self hasProjectSelection ifFalse: [^ self].
	self hasCommitSelection ifFalse: [^ self].
	mergeHeadCommit := self commitSelection.
	self mergeVersionIntoActiveBranch: mergeHeadCommit.