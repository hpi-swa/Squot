actions
actionSetUpstreamBranch
	| gitRepository localBranchName localHistorian |
	self hasBranchSelection ifFalse: [^ self].
	self withUnitOfWork:
	[localHistorian := selectedHistorian.
	localBranchName := localHistorian shortName.
	gitRepository := localHistorian repository fsgitRepository.
	self requestAndSetUpstreamBranchOf: localBranchName
		in: gitRepository
		ifCanceled: [^ self]].