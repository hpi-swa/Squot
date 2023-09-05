as yet unclassified
onFSGitRepository: aFileSystemGitRepository
	^ self new
		fsgitRepository: aFileSystemGitRepository;
		gitInitialize;
		yourself