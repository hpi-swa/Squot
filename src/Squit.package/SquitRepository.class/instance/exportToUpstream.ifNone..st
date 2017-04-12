synchronizing
exportToUpstream: aHistorian ifNone: noUpstreamBlock
	self withCredentialsDo:
		[gitRepository
			pushToUpstreamBranchOf: aHistorian name
			ifNone: noUpstreamBlock]