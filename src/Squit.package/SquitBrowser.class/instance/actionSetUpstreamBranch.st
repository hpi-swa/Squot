actions
actionSetUpstreamBranch
	| localHistorian |
	self hasBranchSelection ifFalse: [^ self].
	localHistorian := selectedHistorian.
	[self withUnitOfWork:
		[self setUpstreamBranchOf: localHistorian]] fork.