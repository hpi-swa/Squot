hashed slots
initializeHashedItems: aDictionary with: aCapturer
	slots at: self metaSlotName
		put: (aDictionary associations collect: [:each |
			(aCapturer capture: each asValueOfSlot: (SquotDictionarySlot key: each key))]).