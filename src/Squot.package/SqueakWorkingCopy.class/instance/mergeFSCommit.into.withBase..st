git-operations
mergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	^ self mappersMapper
		mergeCommit: rightFSCommit
		into: leftFSCommit
		withBase: baseFSCommit
		in: self