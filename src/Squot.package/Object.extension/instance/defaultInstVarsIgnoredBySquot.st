*Squot-trackable
defaultInstVarsIgnoredBySquot
	"Answer a collection of instance variable names that should not be captured by Squot."
	"Since Fuel offers a similar query on the class side, delegate to it if available."
	^ (self class respondsTo: #fuelIgnoredInstanceVariableNames)
		ifTrue: [self class fuelIgnoredInstanceVariableNames]
		ifFalse: [#()]