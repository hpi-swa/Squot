accessing
git
	"Answer an object that can perform Git operations."
	^ GitFeatureFlags useUnitOfWorkInterface
		ifTrue: [GitCurrentUnitOfWork for: gitRepository]
		ifFalse: [gitRepository]