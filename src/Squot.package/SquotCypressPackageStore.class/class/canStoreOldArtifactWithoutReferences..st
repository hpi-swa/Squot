update migration
canStoreOldArtifactWithoutReferences: aTrackedObjectMetadata
	^ (aTrackedObjectMetadata at: #objectClassName ifAbsent: []) = #PackageInfo
		and: [(aTrackedObjectMetadata at: #serializer ifAbsent: []) = #SquotCypressCodeSerializer]