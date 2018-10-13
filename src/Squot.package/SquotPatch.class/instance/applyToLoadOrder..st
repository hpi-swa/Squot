applying
applyToLoadOrder: aCollection
	loadOrderDiff ifNil: [^ aCollection].
	^ loadOrderDiff applyTo: aCollection