*Squot-Tools
newSquotDiffNodes
	| groups topNodes |
	"Similar method: MCPatch>>newSquotDiffNodes"
	groups := ((containerModifications values, containerConflicts values)
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
						self squotDiffNodeForClass: eachClassAndOperations key
							operations: eachClassAndOperations value])
			sort: [:a :b | a title asString <= b title asString]) ,
		((groups associations reject: [:each | each value first definition squotBelongsToClass]) collect: 
			[:eachClassificationAndOperations |
			| classification |
			classification := eachClassificationAndOperations key.
			SquotDiffNode
				title: classification
				content: nil
				children: (eachClassificationAndOperations value
					collect:
						[:each | | dictionary |
						each isConflict
							ifTrue: [dictionary := containerConflicts]
							ifFalse: [dictionary := containerModifications].
						SquotDiffNode
							title: each summary
							content: each
							children: #()
							onInclude: [dictionary at: (self keyOf: each definition) put: each]
							onExclude: [dictionary removeKey: (self keyOf: each definition)]])
				onInclude: []
				onExclude: []]).
	^ topNodes