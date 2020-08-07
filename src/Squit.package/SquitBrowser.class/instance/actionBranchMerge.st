actions on branches
actionBranchMerge
	| historian workingCopy |
	self hasProjectSelection ifFalse: [^ self].
	self hasBranchSelection ifFalse: [^ self].
	historian := selectedHistorian.
	workingCopy := self projectSelection.
	[self withUnitOfWork:
		[self mergeBranch: historian into: workingCopy]] fork.