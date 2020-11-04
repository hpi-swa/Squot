ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch
		diffsDo: 
			[:each | | root |
			root := each asDiffTree.
			each setUpTreeRoot: root toEditPatch: editedPatch.
			root withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy].
			rootNodes add: root].
	rootNodes addAll: self createNodesForUnloaded.
	rootNodes addAll: self createLoadOrderNodes.
	^ rootNodes.