accessing
originalLoadOrder: aCollection
	originalLoadOrder removeAll; addAll: aCollection.
	loadOrderDiff := nil.