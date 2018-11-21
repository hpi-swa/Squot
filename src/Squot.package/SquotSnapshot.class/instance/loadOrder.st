accessing
loadOrder
	^ loadOrder ifNil: [loadOrder := artifacts keys asArray]