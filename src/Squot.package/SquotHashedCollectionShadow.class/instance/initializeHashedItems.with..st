hashed slots
initializeHashedItems: aHashedCollection with: aCapturer
	itemSlots := (aHashedCollection asArray collect: [:each | | slot |
			slot := (aCapturer capture: each asValueOfSlot: SquotHashedCollectionSlot new).
			slot key: (aCapturer nameOf: each ifAbsent: [])]).