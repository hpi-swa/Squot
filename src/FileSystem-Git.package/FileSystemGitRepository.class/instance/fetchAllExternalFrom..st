git porcelain - external
fetchAllExternalFrom: aRemoteName
	self externalGitDo: ('fetch {1}{2}' format: {
		GitFeatureFlags pruneWhenFetching ifTrue: ['--prune '] ifFalse: [''].
		aRemoteName}).
	self refsChangedExternally.