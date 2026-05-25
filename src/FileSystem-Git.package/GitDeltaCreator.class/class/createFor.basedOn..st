instance creation
createFor: aCollection basedOn: aDeltaIndex
	^ (self
		withDeltaIndex: aDeltaIndex
		target: aCollection)
		create