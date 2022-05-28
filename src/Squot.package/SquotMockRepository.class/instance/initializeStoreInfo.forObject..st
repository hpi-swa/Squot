adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: aSnapshot
	(storeInfoInitBlock ifNil: [self error: 'Mock not prepared']) value: aSnapshot value: aTrackedObjectMetadata.