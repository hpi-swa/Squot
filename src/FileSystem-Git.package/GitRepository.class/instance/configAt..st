public-configuration
configAt: aNameString
	self privateDeprecatedUseUnitOfWork.
	^ self configAt: aNameString ifAbsent: [self defaultValueForConfigOption: aNameString].