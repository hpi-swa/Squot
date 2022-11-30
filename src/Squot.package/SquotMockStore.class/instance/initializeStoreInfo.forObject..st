adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: anObject
	(storeInfoInitBlocks at: anObject ifAbsent: [self error: 'Mock not prepared for object: ', anObject printString])
		value: aTrackedObjectMetadata.