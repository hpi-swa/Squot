instance creation
onChanges: aCollection
	^ self new
		changes: aCollection;
		yourself