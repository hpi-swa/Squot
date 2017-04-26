actions
actionMerge
	| mergeHeadCommit |
	self projectSelection ifNil: [^ self].
	self commitSelection ifNil: [^ self].
	mergeHeadCommit := self commitSelection.
	self projectSelection mergeVersionInteractively: mergeHeadCommit.
	(self projectSelection loadedHistorian version = mergeHeadCommit)
		ifTrue: ["fast-forward merge" ^ self refresh].
	[self actionCommit] on: SquotInitialLogMessageRequested
		do: [:request | request resume: 'Merge ', self branchSelection historian name].
	self refresh.