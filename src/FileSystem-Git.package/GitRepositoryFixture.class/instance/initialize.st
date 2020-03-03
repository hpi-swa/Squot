initialize-release
initialize
	repo := FileSystemGitRepository on: FileSystem memory root.
	basicRepo := repo repository.
	GitFeatureFlags useUnitOfWorkInterface ifTrue:
		[basicRepo := basicRepo newUnitOfWork].
	workingCopy := repo withUnitOfWork: [repo head].