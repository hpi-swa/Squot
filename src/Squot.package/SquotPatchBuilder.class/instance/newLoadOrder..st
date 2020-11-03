accessing
newLoadOrder: aCollection
	patchedLoadOrder := aCollection.
	loadOrderDiff := nil.
	self loadOrderMerge newLoadOrder: aCollection.
	diffs do: [:each | loadOrderMerge applyDiff: each].