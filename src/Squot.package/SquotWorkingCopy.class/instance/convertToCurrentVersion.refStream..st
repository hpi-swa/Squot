objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	super convertToCurrentVersion: varDict refStream: smartRefStrm.
	loadOrder ifNil: [loadOrder := store loadOrder].
	unloadedArtifacts ifNil: [unloadedArtifacts := Dictionary new].