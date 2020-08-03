actions on branches
actionBranchMerge
	self hasProjectSelection ifFalse: [^ self].
	self hasBranchSelection ifFalse: [^ self].
	[self withUnitOfWork:
		[self mergeBranch: selectedHistorian into: self projectSelection]] fork.