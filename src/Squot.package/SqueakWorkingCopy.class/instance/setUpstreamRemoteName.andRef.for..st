upstream
setUpstreamRemoteName: remoteString andRef: refString for: aString
	self unitOfWork
		setUpstreamRemoteOfBranchNamed: aString to: remoteString;
		setUpstreamRefOfBranchNamed: aString
		to: (self fsgitRepository expandRemoteRef: refString).