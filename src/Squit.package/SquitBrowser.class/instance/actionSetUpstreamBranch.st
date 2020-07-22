actions
actionSetUpstreamBranch
	| localBranchName localHistorian |
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[localHistorian := selectedHistorian.
	localBranchName := localHistorian shortName.
	self requestAndSetUpstreamBranchOf: localBranchName
		in: localHistorian repository
		ifCanceled: [^ self]].