enumerating
referencesFrom: aDictionary
	| references |
	references := OrderedCollection new.
	references
		addAll: ((class allInstVarNames copyWithoutAll: Dictionary allInstVarNames)
					collect: [:each | SquotInstanceVariable named: each]);
		addAll: ((1 to: (thisContext objectSize: aDictionary))
				collect: [:each | SquotIndexableField index: each]).
	aDictionary keys do: [:each | references add: (SquotDictionaryEntry key: each)].
	^ references