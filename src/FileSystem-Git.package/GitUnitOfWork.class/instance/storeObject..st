storing
storeObject: anObject
	"Stores a GitStorableObject in the repository and answers it."
	^ self objectNamed: anObject hexHash
		ifAbsent:
			[objectStores first store: anObject.
			self assert: (objectCache at: anObject hexHash ifAbsentPut: anObject) = anObject.
			anObject]