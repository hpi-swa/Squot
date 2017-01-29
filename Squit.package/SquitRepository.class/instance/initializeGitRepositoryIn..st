initialize-release
initializeGitRepositoryIn: aDirectoryReference
	aDirectoryReference ensureDirectory.
	self initializeWith: (FileSystemGitRepository on: aDirectoryReference).