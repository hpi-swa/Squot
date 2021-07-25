initialize-release
addTransitiveChangeIn: aSlot
	| change |
	change := SquotSlotTransitiveChange key:
		((aSlot isKindOf: SquotReference)
			ifTrue: [aSlot asSlotDiffKey]
			ifFalse: [aSlot key]).
	slotChanges at: change key ifAbsent: [slotChanges add: change].