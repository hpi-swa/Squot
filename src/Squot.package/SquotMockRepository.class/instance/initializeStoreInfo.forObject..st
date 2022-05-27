adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: aSnapshot
	aTrackedObjectMetadata at: #path put:
		(pathRule value: aSnapshot value: (aTrackedObjectMetadata at: #path)).