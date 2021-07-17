Squot-materializing
materializeIn: aDictionary with: aMaterializer
	self deprecated.
	^ aDictionary add: (aMaterializer rematerialize: self association)