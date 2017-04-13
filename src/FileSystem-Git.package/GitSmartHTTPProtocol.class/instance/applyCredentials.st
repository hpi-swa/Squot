private connection
applyCredentials
	credentials ifNotNil: [ self client username: credentials first; password: credentials second ]