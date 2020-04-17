public-accessing-objects
headerOfObjectNamed: aHash
	self privateDeprecatedUseUnitOfWork.
	^ self
		headerOfObjectNamed: aHash
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: aHash printString, ' not found'
				with: aHash]