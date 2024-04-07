git-operations
cloneFrom: aStringOrUrl
	self handleCredentialsDuring: [ | remote refs head |
		remote := self fsgitRepository addRemote: 'origin' url: aStringOrUrl asUrl.
		refs := self fsgitRepository fetchFrom: 'origin'.
		head := self fsgitRepository remoteHead: refs.
		head ifNotNil: [ | branchName trackingRef branch commit |
			branchName := head allButFirst: 'refs/heads/' size.
			trackingRef := remote trackingRefOf: head.
			commit := self unitOfWork objectReferenced: trackingRef.
			branch := (self createBranchNamed: branchName at: commit) ifNil: [^ self].
			self updateSymbolicHeadToRef: branch]].