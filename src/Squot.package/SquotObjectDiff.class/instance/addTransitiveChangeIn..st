initialize-release
addTransitiveChangeIn: aSlot
	| change |
	change := (SquotSlotTransitiveChange key: aSlot key).
	slotChanges at: change key ifAbsent: [slotChanges add: change].