enumerating
referencesFrom: aHashedCollection
	| references |
	references := OrderedCollection new.
	references
		addAll: ((class allInstVarNames copyWithoutAll: HashedCollection allInstVarNames)
					collect: [:each | SquotInstanceVariable named: each]);
		addAll: ((1 to: (thisContext objectSize: aHashedCollection))
				collect: [:each | SquotIndexableField index: each]).
	self classUsesIdentityHash
		ifTrue: [aHashedCollection do:
				[:each | references add: (SquotCollectionElement target: each)]]
		ifFalse: [aHashedCollection do:
				[:each | references add: (SquotCollectionElement targetWithRelevantHash: each)]].
	^ references