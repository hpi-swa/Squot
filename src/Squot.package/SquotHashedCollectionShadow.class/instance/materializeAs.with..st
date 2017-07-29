rematerializing
materializeAs: aHashedCollection with: aMaterializer
	| collection |
	collection := super materializeAs: aHashedCollection with: aMaterializer.
	self materializeItemsIn: aHashedCollection with: aMaterializer.
	^ collection