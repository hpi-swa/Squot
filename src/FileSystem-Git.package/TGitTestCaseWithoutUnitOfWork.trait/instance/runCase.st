running
runCase
	| previous |
	previous := GitFeatureFlags useUnitOfWorkInterface.
	GitFeatureFlags useUnitOfWorkInterface: self unitOfWorkSetting.
	^ [super runCase]
		ensure: [GitFeatureFlags useUnitOfWorkInterface: previous]