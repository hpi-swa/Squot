merging
mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	^ self
		mergeMappers: (self loadMappersFromFSCommit: rightFSCommit)
		into: (self loadMappersFromFSCommit: leftFSCommit)