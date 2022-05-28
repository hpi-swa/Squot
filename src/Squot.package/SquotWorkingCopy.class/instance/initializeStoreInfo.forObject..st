adding and removing
initializeStoreInfo: storeInfo forObject: anObject
	| shadow |
	shadow := store capture: anObject withMetadata: storeInfo.
	^ self initializeStoreInfo: storeInfo forObject: anObject shadow: shadow