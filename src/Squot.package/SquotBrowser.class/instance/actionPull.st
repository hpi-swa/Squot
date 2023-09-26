actions
actionPull
	| branch remoteNameAndRef remoteName remoteRef remote trackingRef |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	branch := self currentBranchIfNilInformAnd: [^ self].
	remoteNameAndRef := self activeWorkingCopy upstreamRemoteNameAndRefFor: branch.
	remoteNameAndRef ifNil: [^ self].
	remoteName := remoteNameAndRef key.
	remoteRef := remoteNameAndRef value.
	self activeWorkingCopy fetch: remoteName.
	remote := self unitOfWork remoteNamed: remoteName.
	trackingRef := remote trackingRefOf: remoteRef.
	self mergeRefIntoHead: trackingRef.