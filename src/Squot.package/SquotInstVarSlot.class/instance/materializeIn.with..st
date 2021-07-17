Squot-materializing
materializeIn: anObject with: aMaterializer
	self deprecated.
	anObject instVarNamed: self key put: (aMaterializer rematerialize: self value).
	anObject changed: self key asSymbol.