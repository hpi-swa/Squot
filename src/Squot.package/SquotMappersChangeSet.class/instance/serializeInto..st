operations
serializeInto: aFileSystem
	(self referenceIn: aFileSystem) writeStreamDo: [:stream |
		STON put: (self newMappersAfterSerializeInto: aFileSystem) onStreamPretty: stream].