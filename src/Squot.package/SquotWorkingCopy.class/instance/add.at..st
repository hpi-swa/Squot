adding and removing
add: anObject at: path
	| storeInfo |
	storeInfo := SquotTrackedObjectMetadata new.
	storeInfo
		id: SquotArtifact newId;
		at: #path put: path.
	anObject squotInitializeStoreInfo: storeInfo. "Instead of SquotArtifact initializeDefaultStoreInfoFor: anObject"
	^ self add: anObject withStoreInfo: storeInfo