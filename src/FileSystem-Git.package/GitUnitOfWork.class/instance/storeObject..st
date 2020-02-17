storing
storeObject: anObject
	"Stores a GitStorableObject in the repository and answers it."
	^ self objectNamed: anObject hexHash
		ifAbsent:
			[objectStores first store: anObject.
			objectCache at: anObject hexHash put: anObject.
			anObject]