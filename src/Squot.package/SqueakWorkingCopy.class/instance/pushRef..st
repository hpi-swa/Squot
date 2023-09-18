git-operations
pushRef: aString
	| remoteAndRef |
	remoteAndRef := self upstreamRemoteNameAndRefFor: aString.
	remoteAndRef ifNil: [^ self].
	self handleCredentialsDuring: [
		self fsgitRepository push: {aString -> remoteAndRef value} toRemote: remoteAndRef key]