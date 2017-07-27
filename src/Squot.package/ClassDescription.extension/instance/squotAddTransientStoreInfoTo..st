*Squot-trackable
squotAddTransientStoreInfoTo: aTrackableObjectMetadata
	super squotAddTransientStoreInfoTo: aTrackableObjectMetadata.
	aTrackableObjectMetadata at: #environment put: self environment.