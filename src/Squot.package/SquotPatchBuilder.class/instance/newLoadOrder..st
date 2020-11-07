accessing
newLoadOrder: aCollection
	patchedLoadOrder := aCollection asOrderedCollection.
	self updateLoadOrder.