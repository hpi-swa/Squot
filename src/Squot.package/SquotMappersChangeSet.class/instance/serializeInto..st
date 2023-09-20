operations
serializeInto: aFileSystem
	(self referenceIn: aFileSystem) writeStreamDo: [:stream |
		STON put: self newMappers onStreamPretty: stream].