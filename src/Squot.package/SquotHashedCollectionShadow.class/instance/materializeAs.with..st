rematerializing
materializeAs: aHashedCollection with: aMaterializer
	| collection |
	SquotToggles useNewObjectPatching ifTrue: [self deprecated].
	collection := super materializeAs: aHashedCollection with: aMaterializer.
	self materializeItemsIn: aHashedCollection with: aMaterializer.
	^ collection