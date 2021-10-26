initialize-release
addTransitiveChangeIn: aReference
	(aReference isKindOf: SquotCollectionElement) ifTrue:
		[^ itemChanges add: (SquotSlotTransitiveChange key: aReference asSlotDiffKey)].
	^ super addTransitiveChangeIn: aReference