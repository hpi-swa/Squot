git-operations
mergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	^ self materializedMappers collect: [:each |
		each mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit]