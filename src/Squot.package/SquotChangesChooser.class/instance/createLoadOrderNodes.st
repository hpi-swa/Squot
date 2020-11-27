ui diff tree
createLoadOrderNodes
	| loadOrderNodes |
	loadOrderNodes := OrderedCollection new.
	editedPatch addLoadOrderDiffTreeTo: loadOrderNodes.
	loadOrderNodes do: [:each | each withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy]].
	^ loadOrderNodes.