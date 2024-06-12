mappers-creation
loadMetadataFromFileSystem: aFileSystem in: aWorkingCopy
	^ [(self metadataFileReferenceIn: aFileSystem) readStreamDo: [:stream |
		STON fromStream: stream]]
		on: FileDoesNotExist
		do: [^ (self loadMetadataFromWorkingCopy: aWorkingCopy)
				mappers: (self loadLegacyMappersFromFileSystem: aFileSystem)
				yourself]