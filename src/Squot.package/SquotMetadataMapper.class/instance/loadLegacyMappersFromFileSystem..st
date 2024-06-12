mappers-creation
loadLegacyMappersFromFileSystem: aFileSystem
	^ [(self legacyMappersFileReferenceIn: aFileSystem) readStreamDo: [:stream |
		STON fromStream: stream]]
		on: FileDoesNotExist
		do: [^ {}]