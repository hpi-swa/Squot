initialize-release
createFilesystem
	^ (FileSystemGitRepository on: (FileSystem memory / 'testRepo.git')) head.