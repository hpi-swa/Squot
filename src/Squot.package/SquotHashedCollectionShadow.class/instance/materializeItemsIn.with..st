rematerializing
materializeItemsIn: aHashedCollection with: aMaterializer
	self deprecated.
	aHashedCollection removeAll.
	itemSlots do: [:each | each materializeIn: aHashedCollection with: aMaterializer].