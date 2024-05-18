git porcelain - external
fetchAllExternalFrom: aRemoteName
	| remote url |
	remote := self unitOfWork remoteNamed: aRemoteName.
	remote ifNil: [(GitRemoteUndefined remote: remote) signal: 'No URL configured.'].
	self externalGitDo: ('fetch {1}{2}' format: {
		GitFeatureFlags pruneWhenFetching ifTrue: ['--prune '] ifFalse: [''].
		aRemoteName}).
	self refsChangedExternally.
	url := remote url ifNil: [(GitRemoteUndefined remote: remote) signal: 'No URL configured.'].
	^ (GitAbstractProtocol url: url) refs