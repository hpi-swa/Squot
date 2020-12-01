accessing
loadOrder: aCollection
	loadOrder := aCollection asOrderedCollection.
	store loadOrder: (loadOrder intersection: store loadOrder).
	self assertConsistentLoadOrder.