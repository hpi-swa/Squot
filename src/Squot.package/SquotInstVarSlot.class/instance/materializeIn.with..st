Squot-materializing
materializeIn: anObject with: aMaterializer
	anObject instVarNamed: self key put: (aMaterializer rematerialize: self value).
	anObject changed: self key asSymbol.