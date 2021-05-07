node creation
topNodesForMerge: aSquotPackageMerge
	| groups topNodes |
	groups := (aSquotPackageMerge operationsAndConflicts
		groupBy: [:each | each definition squotGroup])
		collect: [:eachGroup | | classOperation |
			"lift class definition changes to the top of each group"
			classOperation := eachGroup detect: [:each | each definition isClassDefinition] ifNone: [].
			classOperation
				ifNil: [eachGroup]
				ifNotNil: [{classOperation}, (eachGroup copyWithout: classOperation)]].
	"Show classes before Organization and Scripts."
	topNodes := (((groups associations select: [:each | each value first definition squotBelongsToClass])
			collect: [:eachClassAndOperations |
						self diffNodeForClass: eachClassAndOperations key
							operationsAndConflicts: eachClassAndOperations value
							modifying: aSquotPackageMerge])
			sort: [:a :b | a title asString <= b title asString]) ,
		((groups associations reject: [:each | each value first definition squotBelongsToClass]) collect: 
			[:eachClassificationAndOperations |
			| classification |
			classification := eachClassificationAndOperations key.
			SquotDiffNode
				title: classification
				content: nil
				children:
					(eachClassificationAndOperations value
						collect: 	[:each | self nodeFor: each from: aSquotPackageMerge])
				onInclude: []
				onExclude: []]).
	^ topNodes