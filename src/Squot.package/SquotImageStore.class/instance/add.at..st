adding and removing
add: anObject at: aPath
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by anObject's default serializer"
	| artifact metadata |
	artifact := self createArtifactFor: anObject at: aPath.
	metadata := artifact storeInfo.
	anObject squotAddTransientStoreInfoTo: metadata.
	artifact := (SquotLiveArtifact on: anObject at: aPath in: self)
		storeInfo: metadata;
		validatePath.
	^ self add: anObject at: artifact path additionalInfo: metadata