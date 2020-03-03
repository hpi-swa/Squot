accessing
gitRepository
	^ GitFeatureFlags useUnitOfWorkInterface
		ifTrue: [GitCurrentUnitOfWork for: gitRepository]
		ifFalse: [gitRepository]