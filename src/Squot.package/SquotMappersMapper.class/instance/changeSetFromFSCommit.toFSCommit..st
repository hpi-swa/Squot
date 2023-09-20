changes-creation
changeSetFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	^ self
		changeSetFromMappers: (self loadMappersFromFSCommit: anFSCommit)
		toMappers: (self loadMappersFromFSCommit: anFSCommit)