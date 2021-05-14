ui diff tree
createRootNodes
	| nodes |
	nodes := OrderedCollection new.
	editedPatch
		diffsDo: [ :each | 
			| root |
			root := each asDiffTree.
			each setUpTreeRoot: root toEditPatch: editedPatch.
			root withAllChildren do: [ :eachNode | eachNode workingCopy: workingCopy ].
			nodes add: root ].
	nodes addAll: self createLoadOrderNodes.
	^ nodes