accessing-objects
packedObjectNamed: aHexHash
	self privateDeprecatedUseUnitOfWork.
	self 
		packedObjectNamed: aHexHash 
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: 'Could not find the requested object in any pack.'
				with: aHexHash ]