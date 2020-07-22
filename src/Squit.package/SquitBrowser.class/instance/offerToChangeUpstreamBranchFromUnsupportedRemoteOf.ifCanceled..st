actions
offerToChangeUpstreamBranchFromUnsupportedRemoteOf: aHistorian ifCanceled: cancelBlock
	| remote |
	remote := aHistorian upstreamRemote.
	(self confirm: 'Synchronizing with the remote at ', remote url, ' is not supported yet. Would you like to choose another remote and make branch ', aHistorian shortName, ' track it?')
		ifFalse: [^ cancelBlock value].
	self requestAndSetUpstreamBranchOf: aHistorian shortName
		in: aHistorian repository
		ifCanceled: [^ cancelBlock value].