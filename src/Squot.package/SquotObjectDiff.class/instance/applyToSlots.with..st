patching
applyToSlots: slotsDictionary with: aDiffBuilder
	slotChanges associationsDo: [:slotDiff |
		slotDiff applyToSlots: slotsDictionary with: aDiffBuilder].
	^ slotsDictionary