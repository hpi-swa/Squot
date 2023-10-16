instance creation
withMapper: aMapper operations: aCollection conflicts: anotherCollection
	^ (self withMapper: aMapper operations: aCollection)
		addConflicts: anotherCollection;
		yourself