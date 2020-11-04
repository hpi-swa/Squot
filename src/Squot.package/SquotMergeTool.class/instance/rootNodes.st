ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch containerConflicts,
	editedPatch containerModifications,
	editedPatch elementMerges
		do:
			[:each | | root |
			root := each asDiffTree.
			each setUpTreeRoot: root toEditMerge: editedPatch.
			root withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy].
			rootNodes add: root].
	rootNodes addAll: self createLoadOrderNodes.
	^ rootNodes