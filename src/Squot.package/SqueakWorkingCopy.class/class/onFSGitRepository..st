instance creation
onFSGitRepository: aFileSystemGitRepository
	^ self new
		fsgitRepository: aFileSystemGitRepository;
		gitInitialize;
		yourself