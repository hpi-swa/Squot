adding and removing
add: anObject at: aPath
	"begin tracking anObject and have it accessible under aPath"
	| artifact |
	artifact := self initializeArtifactFor: anObject at: aPath.
	^ self add: anObject at: artifact path additionalInfo: artifact liveStoreInfo