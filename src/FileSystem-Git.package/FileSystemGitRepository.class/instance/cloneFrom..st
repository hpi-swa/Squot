git porcelain
cloneFrom: aStringOrUrl
	| url |
	url := aStringOrUrl asUrl.
	self addRemote: 'origin' url: aStringOrUrl.
	self fetchFrom: 'origin'.
	repository allReferencesPrefixedWith: 'refs/remotes/origin'
		do: [:each | | branchName |
			branchName := each allButFirst: 'refs/remotes/origin/' size.
			repository
				updateRef: 'refs/heads/', branchName
				to: (repository resolveRef: each);
				setUpstreamRemoteOfBranchNamed: branchName to: 'origin';
				setUpstreamRefOfBranchNamed: branchName
				to: (self expandRemoteRef: branchName)].