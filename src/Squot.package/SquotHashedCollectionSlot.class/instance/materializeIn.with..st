Squot-materializing
materializeIn: aHashedCollection with: aMaterializer
	aHashedCollection add: (aMaterializer rematerialize: self value).