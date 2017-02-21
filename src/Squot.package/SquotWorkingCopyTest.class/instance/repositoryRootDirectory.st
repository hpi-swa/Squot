initialize-release
repositoryRootDirectory
	^ repositoryDirectory ifNil: [repositoryDirectory := FSFilesystem memory root]