adding and removing
initializeStoreInfo: storeInfo forObject: anObject shadow: aShadow
	store initializeStoreInfo: storeInfo forObject: anObject.
	repository initializeStoreInfo: storeInfo forObject: aShadow.
	(store supports: storeInfo forObject: anObject)
		ifFalse: [self error: 'Incompatible store and repository.'].