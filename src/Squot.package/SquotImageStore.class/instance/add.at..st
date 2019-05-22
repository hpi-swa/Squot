adding and removing
add: anObject at: aPath
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by anObject's default serializer"
	| artifact |
	artifact := self initializeArtifactFor: anObject at: aPath.
	artifact 	validatePath.
	^ self add: anObject at: artifact path additionalInfo: artifact liveStoreInfo