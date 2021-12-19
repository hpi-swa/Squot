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
				ifNotNil: [{classOperation},
					"All other definitions; use identity comparison to reject because there can be mixture of MCPatchOperation and MCConflict and they are not =-comparable (hence we cannot use copyWithout:, for example)."
					(eachGroup reject: [:each | classOperation == each])]].
	"Show classes before Organization and Scripts."
	topNodes := (((groups associations select: [:each | each value first definition squotBelongsToClass])
			collect: [:eachClassAndOperations | | classOperationOrConflict |
						classOperationOrConflict := eachClassAndOperations value
							detect: [:each | each definition isClassDefinition]
							ifNone: "Could be a metaclass node, look for corresponding class definition"
								[self classDefOperationOrConflictIn: groups fromOperations: eachClassAndOperations value].
						self diffNodeForClassNamed: eachClassAndOperations key
							operationsAndConflicts: eachClassAndOperations value
							modifying: aSquotPackageMerge
							classOperationOrConflict: classOperationOrConflict])
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