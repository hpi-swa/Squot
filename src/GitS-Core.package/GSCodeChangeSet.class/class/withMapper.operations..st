instance creation
withMapper: aMapper operations: aCollection
	^ (self withMapper: aMapper)
		addOperations: aCollection;
		yourself