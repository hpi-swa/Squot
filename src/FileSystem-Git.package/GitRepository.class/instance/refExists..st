testing
refExists: fullRef
	self privateDeprecatedUseUnitOfWork.
	^ (self baseDir resolve: fullRef) isFile