Squot-materializing
materializeIn: anObjectOfVariableClass with: aMaterializer
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	anObjectOfVariableClass basicAt: self key put: (aMaterializer rematerialize: self value).