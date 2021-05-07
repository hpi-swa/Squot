actions on versions
actionMerge
	| commit workingCopy |
	self hasProjectSelection ifFalse: [^ self].
	self hasCommitSelection ifFalse: [^ self].
	(self hasBranchSelection and: [self withUnitOfWork: [self commitSelection = selectedHistorian version]])
		ifTrue: [^ self actionBranchMerge "Treat as merging the branch"].
	commit := self commitSelection.
	workingCopy := self projectSelection.
	[self withUnitOfWork:
		[self mergeCommit: commit into: workingCopy]] fork.