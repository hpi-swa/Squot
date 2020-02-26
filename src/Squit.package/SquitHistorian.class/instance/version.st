Pur historian
version
	^ repository versionForCommit:
		(GitFeatureFlags useUnitOfWorkInterface
			ifTrue: [GitCurrentUnitOfWork value objectReferenced: referenceName]
			ifFalse: [gitRepository objectReferenced: referenceName])