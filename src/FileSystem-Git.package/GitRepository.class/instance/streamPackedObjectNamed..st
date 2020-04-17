accessing-objects
streamPackedObjectNamed: aHexHash
	self privateDeprecatedUseUnitOfWork.
	^ self 
		streamPackedObjectNamed: aHexHash
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: 'No pack contained the requested object.'
				with: aHexHash ]