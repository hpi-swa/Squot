metadata-creation
newMetadataAfterMaterializeIn: aWorkingCopy
	^ self buildMetadata: [:changeSet | changeSet newValueAfterMaterializeIn: aWorkingCopy]