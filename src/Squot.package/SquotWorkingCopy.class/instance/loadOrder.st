accessing
loadOrder
	^ loadOrder ifNil: [loadOrder := store loadOrder asOrderedCollection]