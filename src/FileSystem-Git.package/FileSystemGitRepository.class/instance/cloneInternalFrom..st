git porcelain
cloneInternalFrom: aStringOrUrl
	| url remoteRefs head |
	url := aStringOrUrl asUrl.
	self addRemote: 'origin' url: aStringOrUrl.
	remoteRefs := self fetchInternalFrom: 'origin'.
	head := self remoteHead: remoteRefs.
	head ifNotNil: [self unitOfWork updateHeadToRef: head message: 'clone: from ', url].
	self unitOfWork allReferencesPrefixedWith: 'refs/remotes/origin/'
		do: [:each | | branchName |
			branchName := each allButFirst: 'refs/remotes/origin/' size.
			self unitOfWork
				updateRef: 'refs/heads/', branchName
				to: (self unitOfWork resolveRef: each);
				setUpstreamRemoteOfBranchNamed: branchName to: 'origin';
				setUpstreamRefOfBranchNamed: branchName
				to: (self expandRemoteRef: branchName)].