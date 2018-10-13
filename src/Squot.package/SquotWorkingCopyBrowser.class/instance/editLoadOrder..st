actions
editLoadOrder: aBlock
	| loadOrder |
	loadOrder := workingCopy loadOrder asOrderedCollection.
	aBlock value: loadOrder.
	workingCopy loadOrder: loadOrder.
	self changed: #objectLabels.