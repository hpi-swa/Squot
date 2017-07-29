Squot-materializing
materializeIn: aDictionary with: aMaterializer
	^ aDictionary add: (aMaterializer rematerialize: self association)