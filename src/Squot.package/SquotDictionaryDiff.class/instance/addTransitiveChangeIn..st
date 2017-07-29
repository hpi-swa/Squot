initialize-release
addTransitiveChangeIn: aSlot
	(aSlot isKindOf: SquotDictionarySlot) ifTrue:
		[^ itemChanges add: (SquotSlotTransitiveChange key: aSlot key)].
	^ super addTransitiveChangeIn: aSlot