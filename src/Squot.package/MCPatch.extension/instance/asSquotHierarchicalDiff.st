*Squot-comparing
asSquotHierarchicalDiff
	| byClass topNodes byClassification operationsWithClass rest |
	operationsWithClass := operations select: [:each | each definition respondsTo: #isCodeDefinition].
	byClass := (operationsWithClass groupBy: [:each | each definition className])
		collect: [:eachGroup | | classOperation |
			"lift class definition changes to the top of each group"
			classOperation := eachGroup detect: [:each | each definition isClassDefinition] ifNone: [].
			classOperation
				ifNil: [eachGroup]
				ifNotNil: [{classOperation}, (eachGroup copyWithout: classOperation)]].
	rest := operations difference: operationsWithClass.
	byClassification := rest groupBy: [:each |
		each definition class allSelectors
			detect: [:any | ('is*Definition' match: any) and:
						[(each definition perform: any) == true]]
			ifNone: ['other']].
	topNodes := (byClass associations collect: [:eachClassAndOperations |
			SquotDiffNode title: eachClassAndOperations key content: nil
				children: (eachClassAndOperations value
					collect: [:each | SquotDiffNode
						title: each squotDiffNodeSummary
						content: each
						children: #()])]) ,
		(byClassification associations collect: [:eachClassificationAndOperations |
			| classification |
			classification := eachClassificationAndOperations key.
			SquotDiffNode
				title: (classification = 'other'
					ifTrue: [classification]
					ifFalse: [classification copyFrom: 3 to: classification size - 'Definition' size])
				content: nil
				children: (eachClassificationAndOperations value
					collect: [:each | SquotDiffNode title: each summary content: each children: #()])]).
	^ topNodes