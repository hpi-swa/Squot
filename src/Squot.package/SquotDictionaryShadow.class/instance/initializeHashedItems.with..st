hashed slots
initializeHashedItems: aDictionary with: aCapturer
	itemSlots := (aDictionary associations collect: [:each |
			(aCapturer capture: each asValueOfSlot: (SquotDictionarySlot key: each key))]).