actions
actionPull
	| headRef branch remoteNameAndRef remoteName remoteRef remote trackingRef |
	headRef := self workingCopy headRef.
	(headRef isSymbolic and: [
		branch := headRef targetRef.
		self workingCopy isSqueakBranchRef: branch])
			ifFalse: [^ self inform: 'Cannot pull when not on a branch.'].
	remoteNameAndRef := self workingCopy upstreamRemoteNameAndRefFor: branch.
	remoteNameAndRef ifNil: [^ self].
	remoteName := remoteNameAndRef key.
	remoteRef := remoteNameAndRef value.
	self workingCopy fetch: remoteName.
	remote := self unitOfWork remoteNamed: remoteName.
	trackingRef := remote trackingRefOf: remoteRef.
	self mergeRefIntoHead: trackingRef.