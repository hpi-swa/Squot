actions
actionSetUpstreamBranch
	| gitRepository localBranchName localHistorian |
	self branchSelection ifNil: [^ self].
	localHistorian := self branchSelection historian.
	localBranchName := localHistorian shortName.
	gitRepository := self projectSelection repository gitRepository.
	self requestAndSetUpstreamBranchOf: localBranchName
		in: gitRepository
		ifCanceled: [^ self].