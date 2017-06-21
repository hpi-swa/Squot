rematerializing
materializeAs: aHashedCollection with: aMaterializer
	(slots at: self metaSlotName) do: [:each |
		 each materializeIn: aHashedCollection with: aMaterializer].
	^ aHashedCollection