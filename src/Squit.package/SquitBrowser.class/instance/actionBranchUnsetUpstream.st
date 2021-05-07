actions on branches
actionBranchUnsetUpstream
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
		[selectedHistorian untrackUpstream].