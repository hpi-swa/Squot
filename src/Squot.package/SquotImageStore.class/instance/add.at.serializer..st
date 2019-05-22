adding and removing
add: anObject at: aPath serializer: aSerializerClass
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by the given serializer"
	| artifact |
	artifact := self initializeArtifactFor: anObject at: aPath.
	artifact liveStoreInfo serializer: aSerializerClass.
	artifact validatePath.
	^ self add: anObject at: artifact path additionalInfo: artifact liveStoreInfo