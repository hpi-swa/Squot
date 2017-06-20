Squot-materializing
materializeIn: anObjectOfVariableClass with: aMaterializer
	anObjectOfVariableClass basicAt: self key put: (aMaterializer rematerialize: self value).