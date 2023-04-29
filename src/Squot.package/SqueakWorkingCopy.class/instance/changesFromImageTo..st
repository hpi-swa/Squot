changes-creation
changesFromImageTo: anFSCommit
	^ self materializedMappers gather: [:each |
		each changesFromImage: self to: anFSCommit]