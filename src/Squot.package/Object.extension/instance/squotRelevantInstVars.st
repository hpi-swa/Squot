*Squot-trackable-capturing
squotRelevantInstVars
	"Answer all instance variable names that should be captured by default."
	^ self class squotRelevantInstVars copyWithoutAll:
		(SquotCurrentMetadata value ignoredInstanceVariablesIn: self)