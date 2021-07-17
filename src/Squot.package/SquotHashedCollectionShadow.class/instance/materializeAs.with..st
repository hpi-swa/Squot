rematerializing
materializeAs: aHashedCollection with: aMaterializer
	| collection |
	self deprecated.
	collection := super materializeAs: aHashedCollection with: aMaterializer.
	self materializeItemsIn: aHashedCollection with: aMaterializer.
	^ collection