hashed slots
initializeHashedItems: aDictionary with: aCapturer
	self flag: #deprecated. "Ask the mirror instead."
	itemSlots := (aDictionary associations collect: [:each | | slot |
		slot := aCapturer capture: each asValueOfSlot: SquotDictionarySlot new.
		slot key: (aCapturer nameOf: each)]).