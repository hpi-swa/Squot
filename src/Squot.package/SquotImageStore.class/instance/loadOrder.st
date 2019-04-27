accessing
loadOrder
	^ loadOrder ifNil: [loadOrder := objects keys asOrderedCollection]