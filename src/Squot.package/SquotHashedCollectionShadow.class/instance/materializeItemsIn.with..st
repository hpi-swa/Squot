rematerializing
materializeItemsIn: aHashedCollection with: aMaterializer
	aHashedCollection removeAll.
	itemSlots do: [:each | each materializeIn: aHashedCollection with: aMaterializer].