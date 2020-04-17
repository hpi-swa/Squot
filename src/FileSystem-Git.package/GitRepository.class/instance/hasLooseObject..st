testing
hasLooseObject: aHexHash
	self privateDeprecatedUseUnitOfWork.
	^ (self referenceToObjectNamed: aHexHash) exists