mappers
readMappersFileFrom: aFileSystem
	^ (self mappersFileReferenceIn: aFileSystem) readStreamDo: [:stream |
		STON fromStream: stream]