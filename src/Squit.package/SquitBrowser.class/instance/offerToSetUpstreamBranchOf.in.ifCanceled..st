user requests
offerToSetUpstreamBranchOf: branchName in: gitRepository ifCanceled: cancelBlock
	(UIManager default confirm: 'No upstream branch configured for branch ', branchName, '. Would you like to set one?')
		ifFalse: [^ cancelBlock value].
	self requestAndSetUpstreamBranchOf: branchName in: gitRepository ifCanceled: cancelBlock.