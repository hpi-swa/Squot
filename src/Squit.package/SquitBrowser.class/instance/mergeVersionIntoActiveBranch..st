actions
mergeVersionIntoActiveBranch: mergeHeadCommit
	self projectSelection mergeVersionInteractively: mergeHeadCommit.
	self projectSelection loadedHistorian version
		 ifNil: ["new branch that got an ancestor now"
			self projectSelection loadedHistorian version: mergeHeadCommit.
			self projectSelection loadedVersion: mergeHeadCommit.
			^ self refresh].
	(self projectSelection loadedHistorian version = mergeHeadCommit)
		ifTrue: ["fast-forward merge" ^ self refresh].
	[self actionCommit] on: SquotInitialLogMessageRequested
		do: [:request | request isNested
			ifTrue: [request pass]
			ifFalse: [request resume: 'Merge branch ', self branchSelection historian shortName]].
	self refresh.