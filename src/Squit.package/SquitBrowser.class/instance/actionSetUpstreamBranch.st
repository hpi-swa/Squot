actions
actionSetUpstreamBranch
	| gitRepository localBranchName localHistorian |
	self hasBranchSelection ifFalse: [^ self].
	localHistorian := selectedHistorian.
	localBranchName := localHistorian shortName.
	gitRepository := self projectSelection repository gitRepository.
	self requestAndSetUpstreamBranchOf: localBranchName
		in: gitRepository
		ifCanceled: [^ self].