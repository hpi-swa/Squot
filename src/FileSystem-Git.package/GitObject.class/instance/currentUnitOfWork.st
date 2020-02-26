public-accessing
currentUnitOfWork
	GitFeatureFlags useUnitOfWorkInterface ifFalse: [^ repository].
	^ GitCurrentUnitOfWork forGitObject: self