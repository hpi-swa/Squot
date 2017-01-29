initialize-release
newRepository
	^ self targetClass new
		initializeInDirectory: self repositoryRootDirectory;
		yourself