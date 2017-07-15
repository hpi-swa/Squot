public-storing
storeObject: anObject
"Stores a GitStorableObject in the repository and answers it."
	^ self objectNamed: anObject hexHash
		ifAbsent: [^ self storeLooseObject: anObject]