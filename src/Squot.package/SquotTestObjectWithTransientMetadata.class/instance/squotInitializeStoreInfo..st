tracking
squotInitializeStoreInfo: aTrackedObjectMetadata
	super squotInitializeStoreInfo: aTrackedObjectMetadata.
	aTrackedObjectMetadata at: #dummy put: {1. 1}.