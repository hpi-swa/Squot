testing
hasPackedObject: aHexHash
	self privateDeprecatedUseUnitOfWork.
	self headerOfPackedObjectNamed: aHexHash ifAbsent: [^ false].
	^ true