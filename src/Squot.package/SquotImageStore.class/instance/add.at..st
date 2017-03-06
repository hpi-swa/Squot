adding and removing
add: anObject at: aPath
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by anObject's default serializer"
	| artifact |
	artifact := self createArtifactFor: anObject at: aPath.
	anObject squotAddTransientStoreInfoTo: artifact storeInfo.
	^ self add: anObject at: artifact path additionalInfo: artifact storeInfo