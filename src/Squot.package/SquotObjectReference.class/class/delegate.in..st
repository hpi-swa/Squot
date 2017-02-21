instance creation
delegate: aDelegate in: aSnapshot
	^ self new
		initializeWith: aDelegate and: aSnapshot;
		yourself