git porcelain - external
fetchAllExternalFrom: aRemoteName
	| remote |
	remote := self unitOfWork remoteNamed: aRemoteName.
	remote ifNil: [(GitRemoteUndefined remote: remote) signal: 'No URL configured.'].
	self externalGitDo: ('fetch {1}' format: {aRemoteName})