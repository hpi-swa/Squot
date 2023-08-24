instance creation
changes: aCollection conflicts: anotherCollection
	^ self new
		changes: aCollection;
		conflicts: anotherCollection;
		yourself