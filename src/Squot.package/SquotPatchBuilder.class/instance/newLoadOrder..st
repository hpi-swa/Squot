public
newLoadOrder: aCollection
	patchedLoadOrder removeAll; addAll: aCollection.
	loadOrderDiff := nil.