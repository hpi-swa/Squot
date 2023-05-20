changes-creation
changesFromFSCommitToImage: anFSCommit
	^ Dictionary newFrom: (self materializedMappers collect: [:each |
		each -> (each changesFromFSCommit: anFSCommit toImage: self)])