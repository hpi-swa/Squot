testing
hasLoadOrderChanges
	^ ((loadOrderDiff applyTo: base loadOrder) hasEqualElements: base loadOrder) not