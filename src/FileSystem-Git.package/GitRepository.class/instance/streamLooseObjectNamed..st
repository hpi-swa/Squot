accessing-objects
streamLooseObjectNamed: aHexHash
	self privateDeprecatedUseUnitOfWork.
	^ self 
		streamLooseObjectNamed: aHexHash 
		ifAbsent: [ GitObjectNotFoundError
			signal: 'Could not find loose object.' 
			with: aHexHash ]