initialize artifacts
initializeStoreInfo: aTrackedObjectMetadata forObject: aShadow
	self flag: #deprecated.
	^ self initializeArtifact: (SquotArtifact storeInfo: aTrackedObjectMetadata) forObject: aShadow