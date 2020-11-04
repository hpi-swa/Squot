actions
moveDownSelectedInLoadOrder
	| loadOrder element index |
	loadOrder := editedPatch newLoadOrder.
	element := self selectedNode content path.
	loadOrder last = element ifTrue: [^ self].
	loadOrder swap: (index := loadOrder indexOf: element) with: index + 1.
	editedPatch newLoadOrder: loadOrder.
	rootNodes swap: (index := rootNodes indexOf: self selectedNode) with: index + 1.
	self updateRootNodesAfterLoadOrderChange.
	self changed: #rootNodes.