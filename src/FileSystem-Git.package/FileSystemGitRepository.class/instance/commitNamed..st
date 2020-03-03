accessing
commitNamed: hexHash
	| repo |
	repo := GitFeatureFlags useUnitOfWorkInterface
		ifTrue: [GitCurrentUnitOfWork for: repository]
		ifFalse: [repository].
	^ self filesystemOn: (repo objectNamed: hexHash)