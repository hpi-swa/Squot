ui diff tree
rootNodes
	| loadOrderNodes |
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := OrderedCollection new.
	editedPatch diffsDo: [:each | | root |
		root := each asDiffTree.
		each setUpTreeRoot: root toEditPatch: editedPatch.
		root withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy].
		rootNodes add: root].
	loadOrderNodes := OrderedCollection new.
	editedPatch addLoadOrderDiffTreeTo: loadOrderNodes.
	loadOrderNodes do: [:each | each withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy]].
	rootNodes addAll: loadOrderNodes.
	^ rootNodes