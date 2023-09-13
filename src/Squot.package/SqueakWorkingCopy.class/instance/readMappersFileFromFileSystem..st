mappers
readMappersFileFromFileSystem: aFileSystem
	^ [(self mappersFileReferenceIn: aFileSystem) readStreamDo: [:stream |
		STON fromStream: stream]]
		on: FileDoesNotExist
		do: [^ {}]