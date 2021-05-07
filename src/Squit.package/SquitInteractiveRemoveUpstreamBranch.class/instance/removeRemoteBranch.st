running
removeRemoteBranch
	| remoteName remoteBranchName |
	remoteName := historian upstreamRemoteName.
	remoteBranchName := historian upstreamHistorianName.
	(self isUpstreamRemoteSupported: historian)
		ifFalse: [self inform: 'The remote is unsupported, therefore the upstream branch cannot be removed from the remote.'. ^ nil].
	(self confirm: 'Really delete branch ', remoteBranchName, ' at the remote ', remoteName, '?')
		ifFalse: [^ nil].
	self handleRemoteErrorsWhile:
		[self handlingCredentialsOf: historian repository
			do: [historian repository
				removeRemoteRef: remoteBranchName from: remoteName]
			ifCanceled: [^ self]]
		afterErrorDo: [^ self].