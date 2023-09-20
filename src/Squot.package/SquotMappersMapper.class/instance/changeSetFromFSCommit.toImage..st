changes-creation
changeSetFromFSCommit: anFSCommit toImage: aWorkingCopy
	^ self
		changeSetFromMappers: (self loadMappersFromFSCommit: anFSCommit)
		toMappers: (self loadMappersFromWorkingCopy: aWorkingCopy)