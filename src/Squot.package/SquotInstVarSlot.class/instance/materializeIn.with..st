Squot-materializing
materializeIn: anObject with: aMaterializer
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	anObject instVarNamed: self key put: (aMaterializer rematerialize: self value).
	anObject changed: self key asSymbol.