instance creation
withDeltaIndex: aDeltaIndex target: aCollection
	^ self new
		deltaIndex: aDeltaIndex;
		target: aCollection;
		yourself