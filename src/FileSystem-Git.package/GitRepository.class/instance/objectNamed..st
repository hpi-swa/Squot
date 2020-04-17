public-accessing-objects
objectNamed: aHash
	self privateDeprecatedUseUnitOfWork.
	aHash ifNil: [^ nil].
	^ self 
		objectNamed: aHash asHexHash 
		ifAbsent: [ 
			GitObjectNotFoundError 
				signal: aHash printString, ' not found'
				with: aHash]