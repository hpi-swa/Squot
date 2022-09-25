initialize-release
setStoreInfo: aTrackedObjectMetadata
	path := aTrackedObjectMetadata at: 'path' ifAbsent: [].
	content := nil.
	storeInfo := aTrackedObjectMetadata.
	id := aTrackedObjectMetadata at: #id.