initialize-release
createFileSystem
	^ (FileSystemGitRepository on: (FileSystem memory / 'testRepo.git')) head.