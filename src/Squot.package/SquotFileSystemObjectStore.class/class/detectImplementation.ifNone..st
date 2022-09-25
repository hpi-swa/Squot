store implementation registry
detectImplementation: aBlock ifNone: errorBlock
	^ ImplementationRegistry detect: aBlock ifNone: errorBlock