initialize-release
repositoryRootDirectory
	^ repositoryDirectory ifNil: [repositoryDirectory := FileSystem memory root]