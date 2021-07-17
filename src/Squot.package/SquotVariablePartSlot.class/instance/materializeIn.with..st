Squot-materializing
materializeIn: anObjectOfVariableClass with: aMaterializer
	self deprecated.
	anObjectOfVariableClass basicAt: self key put: (aMaterializer rematerialize: self value).