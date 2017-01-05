adding and removing
add: anObject at: aPath
	"begin tracking anObject and have it accessible under aPath in a serialized form determined by anObject's default serializer"
	^ self add: anObject at: aPath using: anObject squotPreferredSerializer