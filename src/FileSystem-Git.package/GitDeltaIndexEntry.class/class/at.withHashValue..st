instance creation
at: anIndex withHashValue: aNumber
	^ self new
		index: anIndex;
		hashValue: aNumber;
		yourself