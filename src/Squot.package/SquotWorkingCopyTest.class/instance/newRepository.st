initialize-release
newRepository
	^ self repositoryClass new
		initializeInDirectory: self repositoryRootDirectory;
		yourself