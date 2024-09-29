workspace
workspaceBindings
	^ Dictionary newFrom: {
		'current' -> (self selectedMapper loadAssetFromImage: self activeWorkingCopy).
	}