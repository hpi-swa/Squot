actions
actionSetUpstreamBranch
	| gitRepository localBranchName localHistorian |
	self hasBranchSelection ifFalse: [^ self].
	localHistorian := selectedHistorian.
	localBranchName := localHistorian shortName.
	gitRepository := localHistorian repository fsgitRepository.
	self requestAndSetUpstreamBranchOf: localBranchName
		in: gitRepository
		ifCanceled: [^ self].