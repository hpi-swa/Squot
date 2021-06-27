rematerializing
materializeItemsIn: aHashedCollection with: aMaterializer
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	aHashedCollection removeAll.
	itemSlots do: [:each | each materializeIn: aHashedCollection with: aMaterializer].