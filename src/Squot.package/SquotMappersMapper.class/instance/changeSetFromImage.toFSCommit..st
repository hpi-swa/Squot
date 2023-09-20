changes-creation
changeSetFromImage: aWorkingCopy toFSCommit: anFSCommit
	^ self
		changeSetFromMappers: (self loadMappersFromWorkingCopy: aWorkingCopy)
		toMappers: (self loadMappersFromFSCommit: anFSCommit)