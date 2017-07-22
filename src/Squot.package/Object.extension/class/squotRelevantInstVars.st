*Squot-trackable-capturing
squotRelevantInstVars
	^ ((self == Object ifTrue: [#()] ifFalse: [superclass squotRelevantInstVars]),
		self instVarNames)
	"Since Fuel offers a similar, but negated query, delegate to it if available."
		in: [:vars |
			(self respondsTo: #fuelIgnoredInstanceVariableNames)
				ifTrue: [vars copyWithoutAll: self fuelIgnoredInstanceVariableNames]
				ifFalse: [vars]]