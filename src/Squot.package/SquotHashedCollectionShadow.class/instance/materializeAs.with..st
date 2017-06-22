rematerializing
materializeAs: aHashedCollection with: aMaterializer
	itemSlots do: [:each | each materializeIn: aHashedCollection with: aMaterializer].
	^ aHashedCollection