public-accessing
currentUnitOfWork
	GitFeatureFlags useUnitOfWorkInterface ifFalse: [^ repository].
	^ repository unitOfWork