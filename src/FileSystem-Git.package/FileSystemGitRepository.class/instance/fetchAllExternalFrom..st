git porcelain
fetchAllExternalFrom: aRemoteName
	| remote |
	remote := self unitOfWork remoteNamed: aRemoteName.
	remote ifNil: [(GitRemoteUndefined remote: remote) signal: 'No URL configured.'].
	self externalGitDo: ('pull {1}' format: {aRemoteName}) showText: false