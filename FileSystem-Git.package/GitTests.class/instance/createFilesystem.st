initialize-release
createFilesystem
	^ (FileSystemGitRepository on: (FSFilesystem memory / 'testRepo.git')) head.