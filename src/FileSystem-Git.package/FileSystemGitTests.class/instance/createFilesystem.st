initialize-release
createFilesystem
	| repo |
	repo := FileSystemGitRepository on: (FileSystem memory / 'testRepo.git').
	^ repo withUnitOfWork: [repo head]