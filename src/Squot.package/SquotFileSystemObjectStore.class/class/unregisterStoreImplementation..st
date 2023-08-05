store implementation registry
unregisterStoreImplementation: aClass
	(ImplementationRegistry ifNil: [^ (NotFound object: aClass) signal]) remove: aClass.