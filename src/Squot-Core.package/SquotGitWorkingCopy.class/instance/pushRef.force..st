git-operations
pushRef: aString force: forceBoolean
	| remoteAndRef |
	remoteAndRef := self upstreamRemoteNameAndRefFor: aString.
	remoteAndRef ifNil: [^ self].
	self handleCredentialsDuring: [
		self fsgitRepository push: {aString -> remoteAndRef value} toRemote: remoteAndRef key force: forceBoolean]