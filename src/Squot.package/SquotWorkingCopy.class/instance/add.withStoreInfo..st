adding and removing
add: anObject withStoreInfo: storeInfo
	| correctedPath |
	self initializeStoreInfo: storeInfo forObject: anObject.
	correctedPath := storeInfo removeKey: #path. "for now..."
	store add: anObject at: correctedPath additionalInfo: storeInfo.
	self appendToLoadOrder: correctedPath.
	^ store artifactAt: correctedPath