tracking
squotAddTransientStoreInfoTo: aTrackedObjectMetadata
	super squotAddTransientStoreInfoTo: aTrackedObjectMetadata.
	aTrackedObjectMetadata at: #transient put: 1.