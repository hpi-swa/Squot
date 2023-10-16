instance creation
withMapper: aMapper patch: aCollection
	^ (self withMapper: aMapper)
		addPatch: aCollection;
		yourself