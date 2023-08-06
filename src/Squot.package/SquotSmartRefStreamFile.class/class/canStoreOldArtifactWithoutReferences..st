update migration
canStoreOldArtifactWithoutReferences: aTrackedObjectMetadata
	^ (aTrackedObjectMetadata at: #serializer ifAbsent: []) = #SquotSmartRefStreamSerializer