metadata-creation
newMetadataAfterSerializeInto: aFileSystem
	^ self buildMetadata: [:changeSet | changeSet newValueAfterSerializeInto: aFileSystem]