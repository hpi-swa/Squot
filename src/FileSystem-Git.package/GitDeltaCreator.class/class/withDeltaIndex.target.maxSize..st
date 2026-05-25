instance creation
withDeltaIndex: aDeltaIndex target: aCollection maxSize: aNumber
	^ (self withDeltaIndex: aDeltaIndex target: aCollection)
		maxSize: aNumber;
		yourself