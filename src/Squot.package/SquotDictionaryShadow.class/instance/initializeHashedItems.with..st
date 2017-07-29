hashed slots
initializeHashedItems: aDictionary with: aCapturer
	itemSlots := (aDictionary associations collect: [:each | | slot |
		slot := aCapturer capture: each asValueOfSlot: SquotDictionarySlot new.
		slot key: (aCapturer nameOf: each)]).