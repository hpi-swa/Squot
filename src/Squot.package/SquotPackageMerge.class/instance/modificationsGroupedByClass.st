*Squot-Tools
modificationsGroupedByClass
	| operationsWithClass rest classes |
	operationsWithClass := containerModifications select:
		[:each | each definition respondsTo: #isCodeDefinition].
	classes := (operationsWithClass groupBy: [:each | each definition className])
		collect: [:eachGroup | | classOperation |
			"lift class definition changes to the top of each group"
			classOperation := eachGroup detect: [:each | each definition isClassDefinition] ifNone: [].
			classOperation ifNil: [eachGroup] ifNotNil:
				[{classOperation}, (eachGroup copyWithout: classOperation)]].
	rest := containerModifications copyWithoutAll: operationsWithClass.
	rest := rest groupBy: [:each | each class allSelectors
			detect: [:selector | ('is*Definition' match: selector) and:
								[(each perform: selector) == true]]
			ifNone: ['other']].
	rest keys copy do: "remove is*Definition from the group keys"
		[:eachKey | | group |
		eachKey ~= 'other' ifTrue:
			[group := rest removeKey: eachKey.
			rest
				at: (eachKey copyFrom: 3 to: eachKey size - 'Definition' size)
				put: group]].	
	^ (OrderedDictionary newFrom: classes)
		addAll: rest;
		yourself