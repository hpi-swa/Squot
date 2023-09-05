changes-creation
changesFromFSCommitToImage: anFSCommit
	^ self materializedMappers collect: [:each |
		SquotChanges
			mapper: each
			changes: (each changesFromFSCommit: anFSCommit toImage: self)]