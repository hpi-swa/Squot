initialize-release
createFilesystem
	repository := FileSystemGitRepository on: (FileSystem memory / 'testRepo.git').
	^ repository withUnitOfWork: [repository head]