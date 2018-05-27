public-configuration
remoteNamed: aString
	^ GitRemote new
		name: aString;
		repository: self;
		yourself