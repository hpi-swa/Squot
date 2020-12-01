objects from disk
convertToCurrentVersion: varDict refStream: smartRefStrm
	super convertToCurrentVersion: varDict refStream: smartRefStrm.
	loadOrder ifNil: [loadOrder := store loadOrder asOrderedCollection].
	unloadedArtifacts ifNil: [unloadedArtifacts := Dictionary new].