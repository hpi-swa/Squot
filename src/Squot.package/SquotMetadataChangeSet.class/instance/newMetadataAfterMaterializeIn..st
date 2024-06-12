as yet unclassified
newMetadataAfterMaterializeIn: aWorkingCopy
	^ self buildMetadata: {
		#name -> #nameToWrite.
		#mappers -> [:changeSet | changeSet newMappersAfterMaterializeIn: aWorkingCopy].
	}