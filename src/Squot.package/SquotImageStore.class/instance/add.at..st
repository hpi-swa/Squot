deprecated
add: anObject at: aPath
	"begin tracking anObject and have it accessible under aPath"
	| storeInfo |
	storeInfo := SquotTrackedObjectMetadata new.
	storeInfo id: SquotArtifact newId.
	anObject squotInitializeStoreInfo: storeInfo. "Instead of SquotArtifact initializeDefaultStoreInfoFor: anObject"
	self initializeStoreInfo: storeInfo forObject: anObject.
	^ self add: anObject at: aPath additionalInfo: storeInfo