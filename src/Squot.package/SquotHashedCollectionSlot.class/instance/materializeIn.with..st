Squot-materializing
materializeIn: aHashedCollection with: aMaterializer
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	aHashedCollection add: (aMaterializer rematerialize: self value).