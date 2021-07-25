enumerating
followReferencesOfNewObject: anObject do: aBlock
	| reflected |
	reflected := SquotObjectReflection object: anObject mirror: (mirrors at: anObject undecorated).
	reflected references do:
		[:each | | newTarget |
		newTarget := reflected reflect: each.
		mirrors at: newTarget undecorated put: (reflected nextMirror: each).
		aBlock value: newTarget value: (walk currentPath copyWith: each)].