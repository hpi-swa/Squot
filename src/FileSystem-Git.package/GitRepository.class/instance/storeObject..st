public-storing
storeObject: anObject
"Stores a GitStorableObject in the repository and answers it."
	self privateDeprecatedUseUnitOfWork.
	^ self objectNamed: anObject hexHash
		ifAbsent: [^ self storeLooseObject: anObject]