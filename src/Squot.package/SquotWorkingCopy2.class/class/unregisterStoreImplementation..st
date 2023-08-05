store implementation registry
unregisterStoreImplementation: aClass
	(ObjectStoreImplementationRegistry ifNil: [^ (NotFound object: aClass) signal]) remove: aClass.