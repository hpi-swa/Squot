actions
actionPull
	| headRef branch remoteNameAndRef remoteName remoteRef remote trackingRef |
	self activeWorkingCopyIfNilInformAnd: [^ self].
	headRef := self activeWorkingCopy headRef.
	(headRef isSymbolic and: [
		branch := headRef targetRef.
		self activeWorkingCopy isSqueakBranchRef: branch])
			ifFalse: [^ self inform: 'Cannot pull when not on a branch.'].
	remoteNameAndRef := self activeWorkingCopy upstreamRemoteNameAndRefFor: branch.
	remoteNameAndRef ifNil: [^ self].
	remoteName := remoteNameAndRef key.
	remoteRef := remoteNameAndRef value.
	self activeWorkingCopy fetch: remoteName.
	remote := self unitOfWork remoteNamed: remoteName.
	trackingRef := remote trackingRefOf: remoteRef.
	self mergeRefIntoHead: trackingRef.