synchronizing
exportToUpstream
	| remote mergeBranch |
	self isRemoteTrackingHistorian ifTrue:
		[(SquitIllegalUseOfRemoteTrackingBranch historian: self)
			signal: 'May push only local branches.'].
	remote := self upstreamRemote.
	mergeBranch := self upstreamHistorianName.
	(remote exists not or: [mergeBranch isNil]) ifTrue:
		[^ self errorUpstreamBranchNotConfigured].
	self repository
		export: self
		withName: self upstreamHistorianName
		toRemoteNamed: self upstreamRemoteName.