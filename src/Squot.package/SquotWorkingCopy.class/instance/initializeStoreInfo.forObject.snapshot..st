adding and removing
initializeStoreInfo: storeInfo forObject: anObject snapshot: aSnapshot
	store initializeStoreInfo: storeInfo forObject: anObject.
	repository initializeStoreInfo: storeInfo forObject: aSnapshot.
	(store supports: storeInfo forObject: anObject)
		ifFalse: [self error: 'Incompatible store and repository.'].