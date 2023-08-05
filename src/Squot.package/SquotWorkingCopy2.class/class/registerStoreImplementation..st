store implementation registry
registerStoreImplementation: aClass
	ObjectStoreImplementationRegistry ifNil: [ObjectStoreImplementationRegistry := OrderedCollection new].
	ObjectStoreImplementationRegistry add: aClass.