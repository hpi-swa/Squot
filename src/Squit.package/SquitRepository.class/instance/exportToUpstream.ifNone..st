synchronizing
exportToUpstream: aHistorian ifNone: noUpstreamBlock
	self deprecated: 'Use SquitHistorian>>exportToUpstream instead.'.
	self withCredentialsDo:
		[gitRepository
			pushToUpstreamBranchOf: aHistorian name
			ifNone: noUpstreamBlock]