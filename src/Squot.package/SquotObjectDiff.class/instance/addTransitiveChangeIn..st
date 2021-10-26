initialize-release
addTransitiveChangeIn: aReference
	| change |
	change := SquotSlotTransitiveChange key: aReference asSlotDiffKey.
	slotChanges at: change key ifAbsent: [slotChanges add: change].