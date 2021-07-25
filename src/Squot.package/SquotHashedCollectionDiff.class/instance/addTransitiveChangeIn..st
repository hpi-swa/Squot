initialize-release
addTransitiveChangeIn: aSlot
	(aSlot isKindOf: SquotHashedCollectionSlot) ifTrue:
		[^ itemChanges add: (SquotSlotTransitiveChange key: aSlot key)].
	(aSlot isKindOf: SquotCollectionElement) ifTrue:
		[^ itemChanges add: (SquotSlotTransitiveChange key: aSlot asSlotDiffKey)].
	^ super addTransitiveChangeIn: aSlot