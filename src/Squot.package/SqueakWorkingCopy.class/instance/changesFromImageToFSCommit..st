changes-creation
changesFromImageToFSCommit: anFSCommit
	^ self materializedMappers collect: [:each |
		SquotChanges
			mapper: each
			changes: (each changesFromImage: self toFSCommit: anFSCommit)]