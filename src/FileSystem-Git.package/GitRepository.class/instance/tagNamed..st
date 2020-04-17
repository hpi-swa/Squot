public-accessing-objects
tagNamed: aString
	self privateDeprecatedUseUnitOfWork.
	^ self tagNamed: aString ifAbsent: [ 
		GitObjectNotFoundError 
			signal: 'Tag ', aString, ' not found.'
			with: aString ] 