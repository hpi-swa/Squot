testing
hasObject: aHexHash
	^ (self hasLooseObject: aHexHash)
		or: [self hasPackedObject: aHexHash]