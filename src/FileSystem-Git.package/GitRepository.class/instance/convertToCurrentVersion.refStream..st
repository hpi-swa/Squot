objects from disk
convertToCurrentVersion: varDict refStream: smartRefStream
	self initializeCache.
	^ super convertToCurrentVersion: varDict refStream: smartRefStream