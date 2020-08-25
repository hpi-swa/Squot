public-accessing
currentUnitOfWork
	^ (GitCurrentUnitOfWork forRepository: self)
		ifNil: 
			[GitFeatureFlags warnAboutUseOfDeprecatedMethods ifTrue:
				[Warning signal: 'No active unit of work!'].
			"As a fail-operational measure, create an ad-hoc unit of work."
			self newUnitOfWork]