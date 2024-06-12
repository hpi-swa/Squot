as yet unclassified
newMetadataAfterSerializeInto: aFileSystem
	^ self buildMetadata: {
		#name -> #nameToWrite.
		#mappers -> [:changeSet | changeSet newMappersAfterSerializeInto: aFileSystem].
	}