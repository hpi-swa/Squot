git-operations
mergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	^ Dictionary newFrom: (self materializedMappers collect: [:each |
		each -> (each mergeCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit)])