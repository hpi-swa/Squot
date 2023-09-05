changes-creation
changesFromFSCommit: anFSCommit toFSCommit: anotherFSCommit
	^ self materializedMappers collect: [:each |
		SquotChanges
			mapper: each
			changes: (each changesFromFSCommit: anFSCommit toFSCommit: anotherFSCommit)]