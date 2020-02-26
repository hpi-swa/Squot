public-accessing
currentUnitOfWork
	GitFeatureFlags useUnitOfWorkInterface ifFalse: [^ self].
	^ (GitCurrentUnitOfWork forRepository: self)
		ifNil: [self newUnitOfWork]