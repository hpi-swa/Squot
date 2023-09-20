mappers-creation
loadMappersFromFileSystem: aFileSystem
	^ [(self referenceIn: aFileSystem) readStreamDo: [:stream |
		STON fromStream: stream]]
		on: FileDoesNotExist
		do: [^ {}]