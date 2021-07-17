Squot-materializing
materializeIn: aHashedCollection with: aMaterializer
	self deprecated.
	aHashedCollection add: (aMaterializer rematerialize: self value).