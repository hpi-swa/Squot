upstream historian
upstreamRemote
	self flag: #remoteRepository.
	^ self git remoteNamed: self upstreamRemoteName