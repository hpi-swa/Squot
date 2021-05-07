enumerating
referencesFrom: anObject do: aBlock
	class instVarNames do:
		[:each | | reference |
		reference := SquotInstVarSlot
			key: each
			value: (thisContext object: anObject instVarAt:
						(class instVarIndexFor: each
							ifAbsent: [self error: 'Unexpected lookup error'])).
		aBlock value: reference].
	1 to: (thisContext objectSize: anObject) do:
		[:each | | reference |
		reference := SquotVariablePartSlot
			key: each
			value: (thisContext object: anObject basicAt: each)].