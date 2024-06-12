as yet unclassified
serializeInto: aFileSystem
	(self legacyMappersFileReferenceIn: aFileSystem) ensureDeleted.
	(self metadataFileReferenceIn: aFileSystem) writeStreamDo: [:stream |
		STON put: (self newMetadataAfterSerializeInto: aFileSystem) onStreamPretty: stream].