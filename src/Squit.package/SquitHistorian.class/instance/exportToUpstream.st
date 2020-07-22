synchronizing
exportToUpstream
	| remote mergeBranch |
	self isRemoteTrackingHistorian ifTrue:
		[SquitIllegalUseOfRemoteTrackingBranch new
			remoteTrackingHistorian: self;
			signal: 'May push only local branches.'].
	remote := self upstreamRemote.
	mergeBranch := self upstreamHistorianName.
	(remote exists not or: [mergeBranch isNil]) ifTrue:
		[^ SquitUpstreamUndefined new historian: self; signal: 'Upstream branch is not configured'].
	self repository
		export: self
		withName: self upstreamHistorianName
		toRemoteNamed: self upstreamRemoteName.