private
git
	"Answer an object that can perform Git operations."
	^ GitFeatureFlags useUnitOfWorkInterface
		ifTrue: [GitCurrentUnitOfWork for: gitRepository repository]
		ifFalse: [gitRepository repository]