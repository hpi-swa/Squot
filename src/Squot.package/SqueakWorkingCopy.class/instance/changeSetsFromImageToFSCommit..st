changes-creation
changeSetsFromImageToFSCommit: anFSCommit
	^ self materializedMappers collect: [:each |
		each changeSetFromImage: self toFSCommit: anFSCommit]