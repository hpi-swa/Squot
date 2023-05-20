changes-creation
changesFromImageToFSCommit: anFSCommit
	^ Dictionary newFrom: (self materializedMappers collect: [:each |
		each -> (each changesFromImage: self toFSCommit: anFSCommit)])