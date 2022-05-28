adding and removing
initializeStoreInfo: aTrackedObjectMetadata forObject: aShadow
	(storeInfoInitBlock ifNil: [self error: 'Mock not prepared']) value: aShadow value: aTrackedObjectMetadata.