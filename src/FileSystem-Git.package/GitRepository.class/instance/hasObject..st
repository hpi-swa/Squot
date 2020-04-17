testing
hasObject: aHexHash
	self privateDeprecatedUseUnitOfWork.
	^ (self hasLooseObject: aHexHash)
		or: [self hasPackedObject: aHexHash]