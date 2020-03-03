private
unitOfWork
	GitFeatureFlags useUnitOfWorkInterface ifFalse: [^ repository].
	^ repository currentUnitOfWork