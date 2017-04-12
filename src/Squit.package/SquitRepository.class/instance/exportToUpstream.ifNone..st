synchronizing
exportToUpstream: aHistorian ifNone: noUpstreamBlock
	[gitRepository
		pushToUpstreamBranchOf: aHistorian name
		ifNone: noUpstreamBlock]
	on: NeedGitCredentials do: [:e | e resume: (self credentialsFor: e repositoryUrl)]