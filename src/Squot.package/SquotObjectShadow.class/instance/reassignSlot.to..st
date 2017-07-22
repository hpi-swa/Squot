initialize-release
reassignSlot: slotKey to: aShadow
	(slots includesKey: slotKey)
		ifTrue: [slots at: slotKey put: aShadow]
		ifFalse: [self isThisEverCalled: 'would have to guess the slot type']