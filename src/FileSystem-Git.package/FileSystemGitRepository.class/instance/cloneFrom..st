git porcelain
cloneFrom: aStringOrUrl
	| url |
	url := aStringOrUrl asUrl.
	self addRemote: 'origin' url: aStringOrUrl.
	self fetchFrom: 'origin'.
	self unitOfWork allReferencesPrefixedWith: 'refs/remotes/origin'
		do: [:each | | branchName |
			branchName := each allButFirst: 'refs/remotes/origin/' size.
			self unitOfWork
				updateRef: 'refs/heads/', branchName
				to: (self unitOfWork resolveRef: each);
				setUpstreamRemoteOfBranchNamed: branchName to: 'origin';
				setUpstreamRefOfBranchNamed: branchName
				to: (self expandRemoteRef: branchName)].