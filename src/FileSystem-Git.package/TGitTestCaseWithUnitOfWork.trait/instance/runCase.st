running
runCase
	| previous |
	previous := GitFeatureFlags useUnitOfWorkInterface.
	GitFeatureFlags useUnitOfWorkInterface: true.
	^ [super runCase]
		ensure: [GitFeatureFlags useUnitOfWorkInterface: previous]