changes-creation
changeSetFromImageToFSCommit: anFSCommit
	^ self materializedMappers collect: [:each |
		each changeSetFromImage: self toFSCommit: anFSCommit]