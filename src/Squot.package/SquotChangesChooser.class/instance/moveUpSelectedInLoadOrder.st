actions
moveUpSelectedInLoadOrder
	| loadOrder element index |
	loadOrder := editedPatch newLoadOrder.
	element := self selectedNode content path.
	loadOrder first = element ifTrue: [^ self].
	loadOrder swap: (index := loadOrder indexOf: element) with: index - 1.
	editedPatch newLoadOrder: loadOrder.
	rootNodes swap: (index := rootNodes indexOf: self selectedNode) with: index - 1.
	rootNodes last content ~= editedPatch loadOrderMerge ifTrue:
		[| loadOrderNodes |
		loadOrderNodes := OrderedCollection new.
		editedPatch addLoadOrderDiffTreeTo: loadOrderNodes.
		loadOrderNodes do: [:each | each withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy]].
		rootNodes addAll: loadOrderNodes].
	self changed: #rootNodes.