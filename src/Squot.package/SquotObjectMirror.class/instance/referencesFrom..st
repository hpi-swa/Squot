enumerating
referencesFrom: anObject
	| instVars |
	instVars := class squotRelevantInstVars copyWithoutAll: (SquotCurrentMetadata value ignoredInstanceVariablesIn: anObject).
	^ (instVars collect: [:each | SquotInstanceVariable named: each]),
		((1 to: (thisContext objectSize: anObject)) collect: [:each | SquotIndexableField index: each])