public-operations
removeRemoteNamed: remoteName
	self privateDeprecatedUseUnitOfWork.
	self configUnsetAt: 'remote.', remoteName.
	self allReferencesPrefixedWith: 'refs/remotes/', remoteName
		do: [:each | self deleteRef: each].