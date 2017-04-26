actions
actionSetUpstreamBranch
	| gitRepository localBranchName localHistorian |
	localHistorian := self branchSelection historian.
	localBranchName := localHistorian shortName.
	gitRepository := self projectSelection repository gitRepository.
	self requestAndSetUpstreamBranchOf: localBranchName
		in: gitRepository
		ifCanceled: [^ self].