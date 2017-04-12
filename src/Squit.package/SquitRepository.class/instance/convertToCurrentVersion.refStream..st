objects from disk
convertToCurrentVersion: varDict refStream: smartRefStream
	credentials ifNil: [credentials := Dictionary new].
	^ super convertToCurrentVersion: varDict refStream: smartRefStream