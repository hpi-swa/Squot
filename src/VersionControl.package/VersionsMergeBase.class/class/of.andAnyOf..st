instance creation
of: aVersion andAnyOf: aCollection
	^ self new
		findBaseVersionOf: aVersion andAnyOf: aCollection;
		yourself