workspace
workspaceBindings
	^ Dictionary newFrom: {
		'current' -> (self selectedMapper loadVersionFromImage: self activeWorkingCopy).
	}