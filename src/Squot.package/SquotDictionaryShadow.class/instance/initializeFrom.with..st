as yet unclassified
initializeFrom: aDictionary with: aCapturer
	super initializeFrom: aDictionary with: aCapturer.
	slots at: #associations
		put: (aDictionary associations collect: [:each |
			(aCapturer capture: each asValueOfSlot: (SquotDictionarySlot key: each key))]).