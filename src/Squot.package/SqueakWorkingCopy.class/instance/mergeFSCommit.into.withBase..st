git-operations
mergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	^ self metadataMapper
		mergeCommit: rightFSCommit
		into: leftFSCommit
		withBase: baseFSCommit
		in: self