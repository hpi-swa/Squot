Squot-diff-patching
applyToSlots: slotsDictionary with: aPatcher
	slotsDictionary at: self key put: (aPatcher apply: self value to: (slotsDictionary at: self key)).