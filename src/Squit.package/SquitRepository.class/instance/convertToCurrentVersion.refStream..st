objects from disk
convertToCurrentVersion: varDict refStream: smartRefStream
	credentials ifNil: [credentials := Dictionary new].
	shouldWriteToDiskWorkingCopy ifNil: [shouldWriteToDiskWorkingCopy := false].
	^ super convertToCurrentVersion: varDict refStream: smartRefStream