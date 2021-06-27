Squot-materializing
materializeIn: aDictionary with: aMaterializer
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	^ aDictionary add: (aMaterializer rematerialize: self association)