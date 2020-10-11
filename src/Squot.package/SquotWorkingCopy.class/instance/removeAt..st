adding and removing
removeAt: path
	store removeAt: path.
	self unloadedArtifacts removeKey: path ifAbsent: [].
	loadOrder remove: path ifAbsent: [].