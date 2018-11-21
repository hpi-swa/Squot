accessing
loadOrder: aCollection
	self loadOrder = aCollection ifTrue: [^ self].
	self loadOrder
		removeAll; 
		addAll: aCollection.