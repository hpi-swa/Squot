instance creation
onFSGitRepository: aFileSystemGitRepository named: aString
	^ self new
		fsgitRepository: aFileSystemGitRepository;
		name: aString;
		gitInitialize;
		yourself