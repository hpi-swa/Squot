operations
serializeInto: aFileSystem
	| newMetadata |
	newMetadata := self newMetadataAfterSerializeInto: aFileSystem.
	(newMetadata equalsIncludingMapperVersions: self oldMetadata) ifTrue: [^ self].
	(self legacyReferencesIn: aFileSystem) do: #ensureDeleted.
	(self metadataFileReferenceIn: aFileSystem) writeStreamDo: [:stream |
		STON put: newMetadata onStreamPretty: stream].