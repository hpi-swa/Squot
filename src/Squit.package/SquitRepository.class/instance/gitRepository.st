private
gitRepository
	^ GitFeatureFlags useUnitOfWorkInterface
		ifTrue: [GitCurrentUnitOfWork for: gitRepository repository]
		ifFalse: [gitRepository repository]