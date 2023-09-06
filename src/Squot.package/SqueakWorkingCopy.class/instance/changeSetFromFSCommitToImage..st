changes-creation
changeSetFromFSCommitToImage: anFSCommit
	^ self materializedMappers collect: [:each |
		each changeSetFromFSCommit: anFSCommit toImage: self]