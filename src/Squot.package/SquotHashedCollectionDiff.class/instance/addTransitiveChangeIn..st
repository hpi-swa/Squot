initialize-release
addTransitiveChangeIn: aSlot
	(aSlot isKindOf: SquotHashedCollectionSlot) ifTrue:
		[^ itemChanges add: (SquotSlotTransitiveChange key: aSlot key)].
	^ super addTransitiveChangeIn: aSlot