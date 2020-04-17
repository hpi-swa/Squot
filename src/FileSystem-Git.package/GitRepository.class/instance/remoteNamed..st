public-configuration
remoteNamed: aString
	self privateDeprecatedUseUnitOfWork.
	^ GitRemote new
		name: aString;
		repository: self;
		yourself