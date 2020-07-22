user requests
offerToSetUpstreamBranchOf: aHistorian ifCanceled: cancelBlock
	(UIManager default confirm: 'No upstream branch configured for branch ', aHistorian shortName, '. Would you like to set one?')
		ifFalse: [^ cancelBlock value].
	self requestAndSetUpstreamBranchOf: aHistorian shortName in: aHistorian repository ifCanceled: cancelBlock.