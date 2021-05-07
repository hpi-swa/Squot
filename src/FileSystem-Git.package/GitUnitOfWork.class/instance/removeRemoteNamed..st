remotes
removeRemoteNamed: remoteName
	self configUnsetAt: 'remote.', remoteName.
	self allReferencesPrefixedWith: 'refs/remotes/', remoteName
		do: [:each | self deleteRef: each].