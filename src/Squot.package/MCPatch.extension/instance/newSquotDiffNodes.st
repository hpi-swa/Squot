*Squot-Tools-Diffs
newSquotDiffNodes
	| byClass topNodes byClassification operationsWithClass rest |
	operationsWithClass := operations select: [:each | (each definition respondsTo: #isCodeDefinition) or: (each definition respondsTo: #isTraitDefinition)].
	byClass := (operationsWithClass groupBy: [:each | each definition className])
		collect: [:eachGroup | | classOperation |
			"lift class definition changes to the top of each group"
			classOperation := eachGroup detect: [:each | each definition isClassDefinition] ifNone: [].
			classOperation
				ifNil: [eachGroup]
				ifNotNil: [{classOperation}, (eachGroup copyWithout: classOperation)]].
	rest := operations copyWithoutAll: operationsWithClass.
	byClassification := rest groupBy: [:each |
		each definition class allSelectors
			detect: [:any | ('is*Definition' match: any) and:
						[(each definition perform: any) == true]]
			ifNone: ['other']].
	topNodes := ((byClass associations
			collect: [:eachClassAndOperations |
						self squotDiffNodeForClass: eachClassAndOperations key
							operations: eachClassAndOperations value])
			sort: [:a :b | a title <= b title]) ,
		(byClassification associations collect: [:eachClassificationAndOperations |
			| classification |
			classification := eachClassificationAndOperations key.
			SquotDiffNode
				title: (classification = 'other'
					ifTrue: [classification]
					ifFalse: [classification copyFrom: 3 to: classification size - 'Definition' size])
				content: nil
				children: (eachClassificationAndOperations value
					collect: [:each | SquotDiffNode
										title: each summary
										content: each
										children: #()
										onInclude: [operations add: each]
										onExclude: [operations remove: each]])
				onInclude: []
				onExclude: []]).
	^ topNodes