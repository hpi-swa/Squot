public-accessing-objects
branchNamed: aString
	self privateDeprecatedUseUnitOfWork.
	self validateReferenceOrReferenceName: aString.
	^ self objectNamed: (self resolveRef: 'refs/heads/', aString)