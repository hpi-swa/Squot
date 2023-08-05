store implementation registry
registerStoreImplementation: aClass
	ImplementationRegistry ifNil: [ImplementationRegistry := OrderedCollection new].
	ImplementationRegistry add: aClass.