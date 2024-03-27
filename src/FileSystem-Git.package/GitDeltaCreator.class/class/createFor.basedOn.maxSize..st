instance creation
createFor: aCollection basedOn: aDeltaIndex maxSize: aNumber
	^ (self
		withDeltaIndex: aDeltaIndex
		target: aCollection
		maxSize: aNumber)
		create