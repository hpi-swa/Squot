synchronizing
removeRemoteRef: remoteRef from: remoteName
	self withCredentialsDo:
		[gitRepository
			pushToRemote: remoteName
			deleteRemoteBranches: {remoteRef}]