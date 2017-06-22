hashed slots
initializeHashedItems: aHashedCollection with: aCapturer
	itemSlots := (aHashedCollection asArray collect: [:each |
			(aCapturer capture: each asValueOfSlot: SquotHashedCollectionSlot new)]).