initialize-release
initialize
	repo := FileSystemGitRepository on: FileSystem memory root.
	basicRepo := repo repository.
	workingCopy := repo withUnitOfWork: [repo head].