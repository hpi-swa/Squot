actions
offerToChangeUpstreamBranchFromUnsupportedRemoteOf: localBranchName in: gitRepository ifCanceled: cancelBlock
	| remoteUrl remoteName |
	remoteName := gitRepository repository upstreamRemoteOfBranchNamed: localBranchName.
	remoteUrl := gitRepository repository remoteUrl: remoteName.
	(self confirm: 'Synchronizing with the remote at ', remoteUrl, ' is not supported yet. Would you like to choose another remote and make branch ', localBranchName, ' track it?')
		ifFalse: [^ cancelBlock value].
	self requestAndSetUpstreamBranchOf: localBranchName
		in: gitRepository
		ifCanceled: [^ cancelBlock value].