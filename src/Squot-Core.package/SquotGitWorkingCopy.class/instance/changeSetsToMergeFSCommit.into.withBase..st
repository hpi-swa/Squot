git-operations
changeSetsToMergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	^ self metadataMapper
		changeSetsToMergeFSCommit: rightFSCommit
		into: leftFSCommit
		withBase: baseFSCommit
		in: self