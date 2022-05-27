adding and removing
initializeStoreInfo: storeInfo forObject: anObject
	| snapshot |
	snapshot := store capture: anObject withMetadata: storeInfo.
	^ self initializeStoreInfo: storeInfo forObject: anObject snapshot: snapshot