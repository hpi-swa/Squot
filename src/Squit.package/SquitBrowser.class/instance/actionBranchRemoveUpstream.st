actions on branches
actionBranchRemoveUpstream
	| localHistorian |
	self hasBranchSelection ifFalse: [^ self].
	localHistorian := selectedHistorian.
	[self withUnitOfWork:
		[self removeTrackedRemoteBranch: localHistorian]] fork.