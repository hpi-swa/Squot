ui diff tree
createRootNodes
	| nodes removals remaining |
	nodes := OrderedCollection new.
	SquotToggles useNewApi
		ifTrue:
			[self assert: (editedPatch isKindOf: SquotProjectMerge).
			nodes addAll:
				((editedPatch conflicts select: [:each | each isResolved not]) collect:
					[:each | | root |
					root := each asDiffTree.
					each setUpTreeRoot: root toEditMerge: editedPatch.
					root]).
			nodes addAll: (editedPatch additions collect:
				[:each | | root |
				root := each asDiffTree.
				each setUpTreeRoot: root toEditMerge: editedPatch.
				root]).
			nodes addAll: (editedPatch elementMerges collect:
				[:each | | root |
				root := each asDiffTree.
				each setUpTreeRoot: root toEditMerge: editedPatch.
				root]).
			
			"Reorder like editedPatch result artifacts:"
			remaining := nodes collect: [:each | each artifactDiff object artifact id -> each] as: Dictionary.
			nodes removeAll.
			editedPatch result artifacts do:
				[:each | (remaining removeKey: each id ifAbsent: [])
					ifNotNil: [:node | nodes add: node]].
			nodes addAll: remaining.
			
			removals := editedPatch removals collect:
				[:each | | root |
				root := each asDiffTree.
				each setUpTreeRoot: root toEditMerge: editedPatch.
				root].
			nodes addAll: removals]
		ifFalse:
			[editedPatch
				diffsDo: [ :each | 
					| root |
					root := each asDiffTree.
					each setUpTreeRoot: root toEditPatch: editedPatch.
					nodes add: root ]].
	nodes do: [:eachRoot | eachRoot withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy]].
	nodes addAll: self createLoadOrderNodes.
	^ nodes