instance creation
targetWithRelevantHash: anObject
	^ self new	
		setElement: anObject;
		setHashRelevant;
		yourself