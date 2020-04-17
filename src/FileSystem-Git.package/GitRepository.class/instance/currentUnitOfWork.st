public-accessing
currentUnitOfWork
	GitFeatureFlags useUnitOfWorkInterface ifFalse: [^ self].
	^ (GitCurrentUnitOfWork forRepository: self)
		ifNil: 
			[GitFeatureFlags warnAboutUseOfDeprecatedMethods ifTrue:
				[Warning signal: 'No active unit of work!'].
			self flag: #todo. "creating a unit of work spontaneously is only a workaround"
			self newUnitOfWork]