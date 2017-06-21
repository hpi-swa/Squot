hashed slots
initializeHashedItems: aHashedCollection with: aCapturer
	"Keep the slots in a separate item of the inst var 'slots' because subclasses might add additional instance variables or a variable part."
	slots at: self metaSlotName
		put: (aHashedCollection asArray collect: [:each |
			(aCapturer capture: each asValueOfSlot: SquotHashedCollectionSlot new)]).