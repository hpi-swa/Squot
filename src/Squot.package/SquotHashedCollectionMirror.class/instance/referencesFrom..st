enumerating
referencesFrom: aHashedCollection
	| references |
	references := OrderedCollection new.
	references
		addAll: ((class allInstVarNames copyWithoutAll: HashedCollection allInstVarNames)
					collect: [:each | SquotInstanceVariable named: each]);
		addAll: ((1 to: (thisContext objectSize: aHashedCollection))
				collect: [:each | SquotIndexableField index: each]).
	aHashedCollection do:
		[:each | references add: (SquotCollectionElement target: each)].
	^ references