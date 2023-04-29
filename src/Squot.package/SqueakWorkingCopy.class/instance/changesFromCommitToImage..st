changes-creation
changesFromCommitToImage: anFSCommit
	^ self materializedMappers gather: [:each |
		each changesFrom: anFSCommit toImage: self]