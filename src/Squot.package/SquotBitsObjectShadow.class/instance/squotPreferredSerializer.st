Squot-shadow
squotPreferredSerializer
	^ value isString
		ifTrue: [SquotTextFileCodec]
		ifFalse: [super squotPreferredSerializer]