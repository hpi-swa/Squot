instance creation
startingFrom: aSquotProjectSnapshot
	^ self new
		readFromSnapshot: aSquotProjectSnapshot;
		yourself