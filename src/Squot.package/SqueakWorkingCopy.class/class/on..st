as yet unclassified
on: aFileSystemGitRepository
	^ self new
		fsgitRepository: aFileSystemGitRepository;
		gitInitialize;
		yourself