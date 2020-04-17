public-accessing-objects
sizeOfObjectNamed: aHash
	self privateDeprecatedUseUnitOfWork.
	^ (self headerOfObjectNamed: aHash asHexHash) objectSize